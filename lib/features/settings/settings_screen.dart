import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/cqrs/mediator.dart';
import '../../core/localization/localization.dart';
import '../../core/widgets/care_page.dart';
import 'appearance.dart';
import 'change_appearance/change_appearance.dart';
import 'export_backup/export_backup.dart';
import 'restore_backup/restore_backup.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({required this.mediator, super.key});

  final Mediator mediator;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _exporting = false;
  bool _restoring = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsTitle)),
      body: CarePageBody(
        maxWidth: 760,
        children: <Widget>[
          CarePageHeader(
            title: context.l10n.settingsTitle,
            subtitle: context.l10n.settingsSubtitle,
          ),
          const SizedBox(height: 24),
          _SettingsCard(
            icon: Icons.shield_outlined,
            title: context.l10n.privacyTitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(context.l10n.privacySummary),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: <Widget>[
                    ActionChip(
                      avatar: const Icon(Icons.offline_bolt_outlined, size: 18),
                      label: Text(context.l10n.offlineStatus),
                      onPressed: null,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          _SettingsCard(
            icon: Icons.cloud_upload_outlined,
            title: context.l10n.backupTitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(context.l10n.backupDescription),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _exporting || _restoring ? null : _export,
                  icon: _exporting
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.ios_share_rounded),
                  label: Text(context.l10n.exportBackup),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: _exporting || _restoring ? null : _restore,
                  icon: _restoring
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.settings_backup_restore_rounded),
                  label: Text(context.l10n.restoreBackup),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          _SettingsCard(
            icon: Icons.palette_outlined,
            title: context.l10n.appearance,
            child: StreamBuilder<CareAppearance>(
              stream: widget.mediator.query(const WatchAppearanceQuery()),
              initialData: CareAppearance.system,
              builder: (context, snapshot) {
                final selected = snapshot.data ?? CareAppearance.system;
                return SegmentedButton<CareAppearance>(
                  showSelectedIcon: false,
                  segments: <ButtonSegment<CareAppearance>>[
                    ButtonSegment<CareAppearance>(
                      value: CareAppearance.system,
                      icon: const Icon(Icons.brightness_auto_rounded),
                      label: Text(context.l10n.systemTheme),
                    ),
                    ButtonSegment<CareAppearance>(
                      value: CareAppearance.light,
                      icon: const Icon(Icons.light_mode_outlined),
                      label: Text(context.l10n.lightTheme),
                    ),
                    ButtonSegment<CareAppearance>(
                      value: CareAppearance.dark,
                      icon: const Icon(Icons.dark_mode_outlined),
                      label: Text(context.l10n.darkTheme),
                    ),
                  ],
                  selected: <CareAppearance>{selected},
                  onSelectionChanged: (selection) {
                    widget.mediator.send<void>(SetAppearanceCommand(selection.single));
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 14),
          _SettingsCard(
            icon: Icons.info_outline_rounded,
            title: context.l10n.about,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(context.l10n.notMedicalAdvice),
                const SizedBox(height: 10),
                Text(context.l10n.workingNameNotice),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: Text(context.l10n.privacyPolicy),
                  trailing: const Icon(Icons.open_in_new_rounded),
                  onTap: () => _openSite('/privacy/'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.description_outlined),
                  title: Text(context.l10n.termsOfService),
                  trailing: const Icon(Icons.open_in_new_rounded),
                  onTap: () => _openSite('/terms/'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.help_outline_rounded),
                  title: Text(context.l10n.support),
                  trailing: const Icon(Icons.open_in_new_rounded),
                  onTap: () => _openSite('/support/'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _export() async {
    setState(() => _exporting = true);
    try {
      final file = await widget.mediator.send(const ExportBackupCommand());
      if (!mounted) {
        return;
      }
      final box = context.findRenderObject() as RenderBox?;
      await SharePlus.instance.share(
        ShareParams(
          files: <XFile>[XFile(file.path)],
          subject: context.l10n.backupTitle,
          sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size,
        ),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.backupReady)),
        );
      }
    } on Object {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.backupFailed)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _exporting = false);
      }
    }
  }

  Future<void> _restore() async {
    const typeGroup = XTypeGroup(label: 'CareCache backup', extensions: <String>['carecache']);
    final file = await openFile(acceptedTypeGroups: const <XTypeGroup>[typeGroup]);
    if (file == null || !mounted) {
      return;
    }
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.restoreWarningTitle),
        content: Text(context.l10n.restoreWarningDescription),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(context.l10n.restore),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) {
      return;
    }
    setState(() => _restoring = true);
    try {
      await widget.mediator.send<void>(RestoreBackupCommand(file.path));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.restoreComplete)),
        );
      }
    } on Object {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.restoreFailed)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _restoring = false);
      }
    }
  }

  Future<void> _openSite(String path) async {
    const base = String.fromEnvironment(
      'CARECACHE_SITE_URL',
      defaultValue: 'https://carecache.vector42.app',
    );
    await launchUrl(Uri.parse('$base$path'), mode: LaunchMode.externalApplication);
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.icon, required this.title, required this.child});

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: colors.primary),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}
