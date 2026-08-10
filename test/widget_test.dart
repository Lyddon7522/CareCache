import 'package:carecache/app/app_dependencies.dart';
import 'package:carecache/app/care_cache_app.dart';
import 'package:carecache/core/database/app_database.dart';
import 'package:carecache/features/inventory/save_supply/save_supply.dart';
import 'package:carecache/features/inventory/supply.dart';
import 'package:carecache/features/schedule/care_task.dart';
import 'package:carecache/features/schedule/reminder_scheduler.dart';
import 'package:carecache/features/schedule/save_task/save_task.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows an actionable empty Overview and opens Settings', (tester) async {
    final dependencies = await AppDependencies.create(
      database: AppDatabase(NativeDatabase.memory()),
      reminders: const NoopReminderScheduler(),
    );

    await tester.pumpWidget(CareCacheApp(dependencies: dependencies));
    await tester.pumpAndSettle();

    expect(find.text('Overview'), findsNWidgets(2));
    expect(find.text('Start here'), findsOneWidget);
    expect(find.text('Track your first supply'), findsOneWidget);
    expect(find.text('Scan supply'), findsNWidgets(2));
    expect(find.text('Add supply'), findsNWidgets(2));
    final emptyHero = find.byKey(const Key('overview-status-hero'));
    expect(
      find.descendant(of: emptyHero, matching: find.text('Scan supply')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: emptyHero, matching: find.text('Add supply')),
      findsOneWidget,
    );
    expect(find.text('Add device'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byKey(const Key('quick-action-add-schedule')),
        matching: find.text('Schedule'),
      ),
      findsOneWidget,
    );
    expect(find.text('Upcoming reminders'), findsOneWidget);
    expect(find.text('No reminders scheduled'), findsOneWidget);
    expect(find.text('Inventory snapshot'), findsOneWidget);
    expect(find.text('Private and on this device'), findsNothing);
    expect(find.text('Your care, at a glance'), findsNothing);
    expect(find.text('Start your care shelf'), findsNothing);

    await tester.ensureVisible(find.byKey(const Key('upcoming-empty-card')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('upcoming-empty-card')));
    await tester.pumpAndSettle();

    expect(find.text('New schedule'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Privacy and backup'), findsWidgets);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump(const Duration(milliseconds: 1));
    await dependencies.dispose();
  });

  testWidgets('shows concrete low-stock and overdue records in Overview', (tester) async {
    final dependencies = await AppDependencies.create(
      database: AppDatabase(NativeDatabase.memory()),
      reminders: const NoopReminderScheduler(),
    );
    final now = DateTime.now();
    await dependencies.mediator.send<String>(
      SaveSupplyCommand(
        SupplyDraft(
          name: 'Fine filter',
          category: SupplyCategory.cpap,
          unitLabel: 'filter',
          quantityOnHand: 1,
          reorderPoint: 2,
        ),
      ),
    );
    await dependencies.mediator.send<String>(
      SaveTaskCommand(
        CareTaskDraft(
          title: 'Clean humidifier',
          kind: CareTaskKind.clean,
          cadenceDays: 7,
          nextDueAt: now.subtract(const Duration(days: 1)),
          remindersEnabled: false,
          reminderMinutesAfterMidnight: 9 * 60,
        ),
      ),
    );
    await dependencies.mediator.send<String>(
      SaveTaskCommand(
        CareTaskDraft(
          title: 'Replace mask cushion',
          kind: CareTaskKind.replace,
          cadenceDays: 30,
          nextDueAt: now.add(const Duration(days: 3)),
          remindersEnabled: true,
          reminderMinutesAfterMidnight: 9 * 60,
        ),
      ),
    );

    await tester.pumpWidget(CareCacheApp(dependencies: dependencies));
    await tester.pumpAndSettle();

    expect(find.text('Needs attention'), findsWidgets);
    expect(find.text('Fine filter'), findsOneWidget);
    expect(find.text('Clean humidifier'), findsOneWidget);
    expect(find.text('Upcoming reminders'), findsOneWidget);
    expect(find.text('Replace mask cushion'), findsOneWidget);
    expect(find.text('Repeats every 30 days'), findsOneWidget);
    expect(find.byKey(const Key('next-reminder-card')), findsOneWidget);
    expect(find.text('Inventory snapshot'), findsOneWidget);
    expect(find.text('Start here'), findsNothing);
    expect(find.text('Scan supply'), findsOneWidget);
    expect(find.text('Add supply'), findsOneWidget);
    final populatedHero = find.byKey(const Key('overview-status-hero'));
    expect(
      find.descendant(of: populatedHero, matching: find.text('Scan supply')),
      findsNothing,
    );
    expect(
      find.descendant(of: populatedHero, matching: find.text('Add supply')),
      findsNothing,
    );

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump(const Duration(milliseconds: 1));
    await dependencies.dispose();
  });

  testWidgets('quick actions scroll horizontally and open their destinations', (tester) async {
    tester.view.physicalSize = const Size(430, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final dependencies = await AppDependencies.create(
      database: AppDatabase(NativeDatabase.memory()),
      reminders: const NoopReminderScheduler(),
    );

    await tester.pumpWidget(CareCacheApp(dependencies: dependencies));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('quick-actions-scroll')));
    await tester.pumpAndSettle();

    const actionKeys = <Key>[
      Key('quick-action-scan'),
      Key('quick-action-replace'),
      Key('quick-action-add-supply'),
      Key('quick-action-add-schedule'),
      Key('quick-action-add-device'),
    ];
    for (final key in actionKeys) {
      expect(find.byKey(key), findsOneWidget);
      expect(tester.getSize(find.byKey(key)).height, greaterThanOrEqualTo(48));
    }
    final firstActionTop = tester.getTopLeft(find.byKey(actionKeys.first)).dy;
    for (final key in actionKeys.skip(1)) {
      expect(tester.getTopLeft(find.byKey(key)).dy, closeTo(firstActionTop, 0.1));
    }
    expect(tester.getSize(find.byKey(const Key('quick-actions-grid'))).height, lessThan(130));
    final railScrollable = find.descendant(
      of: find.byKey(const Key('quick-actions-scroll')),
      matching: find.byType(Scrollable),
    );
    final railPosition = tester.state<ScrollableState>(railScrollable).position;
    expect(railPosition.maxScrollExtent, greaterThan(0));

    await tester.drag(find.byKey(const Key('quick-actions-scroll')), const Offset(-120, 0));
    await tester.pumpAndSettle();
    expect(railPosition.pixels, greaterThan(0));

    await tester.tap(find.byKey(const Key('quick-action-add-schedule')));
    await tester.pumpAndSettle();

    expect(find.text('New schedule'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump(const Duration(milliseconds: 1));
    await dependencies.dispose();
  });

  testWidgets('keeps the Overview usable on a small phone with larger text', (tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 1.6;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
      tester.platformDispatcher.clearTextScaleFactorTestValue();
    });
    final dependencies = await AppDependencies.create(
      database: AppDatabase(NativeDatabase.memory()),
      reminders: const NoopReminderScheduler(),
    );

    await tester.pumpWidget(CareCacheApp(dependencies: dependencies));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('overview-status-hero')), findsOneWidget);
    expect(find.text('Upcoming reminders'), findsOneWidget);
    expect(find.text('Add or scan'), findsNothing);
    await tester.ensureVisible(find.byKey(const Key('quick-actions-grid')));
    await tester.pumpAndSettle();

    final scanTop = tester.getTopLeft(find.byKey(const Key('quick-action-scan'))).dy;
    final replaceTop = tester.getTopLeft(find.byKey(const Key('quick-action-replace'))).dy;
    final supplyTop = tester.getTopLeft(find.byKey(const Key('quick-action-add-supply'))).dy;
    final scheduleTop = tester.getTopLeft(find.byKey(const Key('quick-action-add-schedule'))).dy;
    final deviceTop = tester.getTopLeft(find.byKey(const Key('quick-action-add-device'))).dy;
    expect(replaceTop, closeTo(scanTop, 0.1));
    expect(supplyTop, greaterThan(scanTop));
    expect(scheduleTop, closeTo(supplyTop, 0.1));
    expect(deviceTop, greaterThan(scheduleTop));
    expect(find.byKey(const Key('quick-actions-scroll')), findsNothing);
    expect(tester.getSize(find.byKey(const Key('quick-actions-grid'))).height, lessThan(250));
    expect(tester.takeException(), isNull);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump(const Duration(milliseconds: 1));
    await dependencies.dispose();
  });

  testWidgets('bottom navigation returns top-level pages to the top', (tester) async {
    final dependencies = await AppDependencies.create(
      database: AppDatabase(NativeDatabase.memory()),
      reminders: const NoopReminderScheduler(),
    );
    await tester.pumpWidget(CareCacheApp(dependencies: dependencies));
    await tester.pumpAndSettle();

    double visiblePageOffset() {
      final scrollable = find.descendant(
        of: find.byType(ListView),
        matching: find.byType(Scrollable),
      );
      return tester.state<ScrollableState>(scrollable.first).position.pixels;
    }

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();
    expect(visiblePageOffset(), greaterThan(0));

    await tester.tap(find.byIcon(Icons.inventory_2_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.dashboard_outlined));
    await tester.pumpAndSettle();

    expect(visiblePageOffset(), 0);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();
    expect(visiblePageOffset(), greaterThan(0));

    await tester.tap(find.byIcon(Icons.dashboard_rounded));
    await tester.pumpAndSettle();

    expect(visiblePageOffset(), 0);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump(const Duration(milliseconds: 1));
    await dependencies.dispose();
  });
}
