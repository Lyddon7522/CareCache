import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/localization/localization.dart';

class AdaptiveAppShell extends StatelessWidget {
  const AdaptiveAppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final destinations = <NavigationDestination>[
          NavigationDestination(
            icon: const Icon(Icons.dashboard_outlined),
            selectedIcon: const Icon(Icons.dashboard_rounded),
            label: context.l10n.navigationOverview,
          ),
          NavigationDestination(
            icon: const Icon(Icons.inventory_2_outlined),
            selectedIcon: const Icon(Icons.inventory_2_rounded),
            label: context.l10n.navigationInventory,
          ),
          NavigationDestination(
            icon: const Icon(Icons.event_repeat_outlined),
            selectedIcon: const Icon(Icons.event_repeat_rounded),
            label: context.l10n.navigationSchedule,
          ),
          NavigationDestination(
            icon: const Icon(Icons.devices_other_outlined),
            selectedIcon: const Icon(Icons.devices_other_rounded),
            label: context.l10n.navigationDevices,
          ),
        ];
        if (constraints.maxWidth >= 760) {
          return Scaffold(
            body: Row(
              children: <Widget>[
                NavigationRail(
                  selectedIndex: navigationShell.currentIndex,
                  labelType: NavigationRailLabelType.all,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 20),
                    child: FloatingActionButton.extended(
                      heroTag: 'wide-scan',
                      onPressed: () => context.push('/scan'),
                      icon: const Icon(Icons.qr_code_scanner_rounded),
                      label: Text(context.l10n.scan),
                    ),
                  ),
                  destinations: destinations
                      .map(
                        (destination) => NavigationRailDestination(
                          icon: destination.icon,
                          selectedIcon: destination.selectedIcon,
                          label: Text(destination.label),
                        ),
                      )
                      .toList(growable: false),
                  onDestinationSelected: _goBranch,
                ),
                VerticalDivider(width: 1, color: Theme.of(context).colorScheme.outlineVariant),
                Expanded(child: navigationShell),
              ],
            ),
          );
        }
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            destinations: destinations,
            onDestinationSelected: _goBranch,
          ),
          floatingActionButton: navigationShell.currentIndex == 1
              ? FloatingActionButton(
                  heroTag: 'compact-scan',
                  onPressed: () => context.push('/scan'),
                  tooltip: context.l10n.scanSupply,
                  child: const Icon(Icons.qr_code_scanner_rounded),
                )
              : null,
        );
      },
    );
  }

  void _goBranch(int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }
}
