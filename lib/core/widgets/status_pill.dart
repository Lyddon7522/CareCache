import 'package:flutter/material.dart';

class StatusPill extends StatelessWidget {
  const StatusPill({
    required this.label,
    required this.icon,
    this.tone = StatusTone.neutral,
    super.key,
  });

  final String label;
  final IconData icon;
  final StatusTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final (background, foreground) = switch (tone) {
      StatusTone.good => (colors.primaryContainer, colors.onPrimaryContainer),
      StatusTone.warning => (colors.secondaryContainer, colors.onSecondaryContainer),
      StatusTone.danger => (colors.errorContainer, colors.onErrorContainer),
      StatusTone.neutral => (colors.surfaceContainerHighest, colors.onSurfaceVariant),
    };
    return DecoratedBox(
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(999)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 15, color: foreground),
            const SizedBox(width: 5),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum StatusTone { good, warning, danger, neutral }
