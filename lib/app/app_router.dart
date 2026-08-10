import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../core/cqrs/mediator.dart';
import '../features/devices/save_device/device_editor_screen.dart';
import '../features/devices/watch_devices/devices_screen.dart';
import '../features/inventory/save_supply/supply_editor_screen.dart';
import '../features/inventory/watch_inventory/inventory_screen.dart';
import '../features/overview/overview_screen.dart';
import '../features/scanner/barcode_scanner_screen.dart';
import '../features/schedule/save_task/task_editor_screen.dart';
import '../features/schedule/watch_schedule/schedule_screen.dart';
import '../features/settings/settings_screen.dart';
import 'adaptive_app_shell.dart';

GoRouter createAppRouter(Mediator mediator) {
  final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/overview',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AdaptiveAppShell(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/overview',
                builder: (context, state) => OverviewScreen(mediator: mediator),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/inventory',
                builder: (context, state) => InventoryScreen(mediator: mediator),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/schedule',
                builder: (context, state) => ScheduleScreen(mediator: mediator),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/devices',
                builder: (context, state) => DevicesScreen(mediator: mediator),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/scan',
        builder: (context, state) => BarcodeScannerScreen(
          mediator: mediator,
          returnBarcodeOnly: state.uri.queryParameters['returnBarcode'] == 'true',
          replacementMode: state.uri.queryParameters['replacement'] == 'true',
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/inventory/new',
        builder: (context, state) => SupplyEditorScreen(
          mediator: mediator,
          initialBarcode: state.uri.queryParameters['barcode'],
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/inventory/:supplyId',
        builder: (context, state) => SupplyEditorScreen(
          mediator: mediator,
          supplyId: state.pathParameters['supplyId'],
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/devices/new',
        builder: (context, state) => DeviceEditorScreen(mediator: mediator),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/devices/:deviceId',
        builder: (context, state) => DeviceEditorScreen(
          mediator: mediator,
          deviceId: state.pathParameters['deviceId'],
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/schedule/new',
        builder: (context, state) => TaskEditorScreen(mediator: mediator),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/schedule/:taskId',
        builder: (context, state) => TaskEditorScreen(
          mediator: mediator,
          taskId: state.pathParameters['taskId'],
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/settings',
        builder: (context, state) => SettingsScreen(mediator: mediator),
      ),
    ],
  );
}
