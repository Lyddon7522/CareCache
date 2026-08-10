import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/cqrs/mediator.dart';
import '../../../core/localization/localization.dart';
import '../../../core/widgets/care_page.dart';
import '../../../core/widgets/empty_state.dart';
import '../device.dart';
import '../device_localization.dart';
import 'devices_view_model.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({required this.mediator, super.key});

  final Mediator mediator;

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  late final DevicesViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = DevicesViewModel(widget.mediator);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => context.push('/settings'),
            tooltip: context.l10n.settings,
            icon: const Icon(Icons.settings_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: AnimatedBuilder(
        animation: _viewModel,
        builder: (context, _) {
          return CarePageBody(
            navigationIndex: 3,
            children: <Widget>[
              CarePageHeader(
                title: context.l10n.devicesTitle,
                subtitle: context.l10n.devicesSubtitle,
                trailing: IconButton.filled(
                  onPressed: () => context.push('/devices/new'),
                  tooltip: context.l10n.addDevice,
                  icon: const Icon(Icons.add_rounded),
                ),
              ),
              const SizedBox(height: 24),
              if (_viewModel.loading)
                const Center(
                  child: Padding(padding: EdgeInsets.all(32), child: CircularProgressIndicator()),
                )
              else if (_viewModel.error != null)
                EmptyState(
                  icon: Icons.error_outline_rounded,
                  title: context.l10n.unexpectedError,
                  description: context.l10n.tryAgain,
                )
              else if (_viewModel.devices.isEmpty)
                EmptyState(
                  icon: Icons.air_rounded,
                  title: context.l10n.devicesEmpty,
                  description: context.l10n.devicesEmptyDescription,
                  action: FilledButton.icon(
                    onPressed: () => context.push('/devices/new'),
                    icon: const Icon(Icons.add_rounded),
                    label: Text(context.l10n.addDevice),
                  ),
                )
              else
                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth >= 760 ? 2 : 1;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        mainAxisExtent: 176,
                      ),
                      itemCount: _viewModel.devices.length,
                      itemBuilder: (context, index) => _DeviceCard(
                        device: _viewModel.devices[index],
                        onTap: () => context.push('/devices/${_viewModel.devices[index].id}'),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}

class _DeviceCard extends StatelessWidget {
  const _DeviceCard({required this.device, required this.onTap});

  final MedicalDevice device;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final details = <String?>[
      device.manufacturer,
      device.modelNumber,
    ].whereType<String>().join(' · ');
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Icon(Icons.air_rounded, size: 28, color: colors.onPrimaryContainer),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      device.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      device.category.label(context.l10n),
                      style: TextStyle(color: colors.onSurfaceVariant),
                    ),
                    if (details.isNotEmpty) ...<Widget>[
                      const SizedBox(height: 10),
                      Text(details, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                    if (device.serialNumber != null) ...<Widget>[
                      const SizedBox(height: 4),
                      Text(
                        '${context.l10n.serialNumber}: ${device.serialNumber}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
