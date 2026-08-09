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
    expect(find.text('Add your first item'), findsOneWidget);
    expect(find.text('Scan supply'), findsOneWidget);
    expect(find.text('Add supply'), findsOneWidget);
    expect(find.text('Add device'), findsOneWidget);
    expect(find.text('Add schedule'), findsOneWidget);
    expect(find.text('Private and on this device'), findsNothing);
    expect(find.text('Your care, at a glance'), findsNothing);
    expect(find.text('Start your care shelf'), findsNothing);

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

    await tester.pumpWidget(CareCacheApp(dependencies: dependencies));
    await tester.pumpAndSettle();

    expect(find.text('Needs attention'), findsOneWidget);
    expect(find.text('Fine filter'), findsOneWidget);
    expect(find.text('Clean humidifier'), findsOneWidget);
    expect(find.text('Status'), findsOneWidget);
    expect(find.text('Add your first item'), findsNothing);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump(const Duration(milliseconds: 1));
    await dependencies.dispose();
  });
}
