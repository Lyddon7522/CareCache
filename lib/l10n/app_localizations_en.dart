// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'CareCache';

  @override
  String get tagline => 'Know what you have. Know what is next.';

  @override
  String get navigationOverview => 'Overview';

  @override
  String get navigationInventory => 'Inventory';

  @override
  String get navigationSchedule => 'Schedule';

  @override
  String get navigationDevices => 'Devices';

  @override
  String get overviewTitle => 'Overview';

  @override
  String get nothingNeedsAttention => 'Nothing needs attention';

  @override
  String get nothingNeedsAttentionDescription => 'No overdue tasks or low-stock supplies.';

  @override
  String get everythingOnTrack => 'Everything is on track';

  @override
  String get getStarted => 'Start here';

  @override
  String get trackFirstSupply => 'Track your first supply';

  @override
  String get trackFirstSupplyDescription => 'Scan a barcode or add the details manually.';

  @override
  String get needsAttention => 'Needs attention';

  @override
  String attentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items need attention',
      one: '1 item needs attention',
    );
    return '$_temp0';
  }

  @override
  String get attentionDescription => 'Review overdue schedules and supplies that are running low.';

  @override
  String get dueSoon => 'Due soon';

  @override
  String get lowStock => 'Low stock';

  @override
  String get nextUp => 'Next up';

  @override
  String get upcomingReminders => 'Upcoming reminders';

  @override
  String get noUpcomingReminders => 'No reminders scheduled';

  @override
  String get noUpcomingRemindersDescription =>
      'Add a cleaning, replacement, or maintenance schedule.';

  @override
  String get viewAll => 'View all';

  @override
  String get quickActions => 'Add or scan';

  @override
  String get statusSummary => 'Status';

  @override
  String get inventorySnapshot => 'Inventory snapshot';

  @override
  String get scheduled => 'Scheduled';

  @override
  String get onHand => 'On hand';

  @override
  String get inStock => 'In stock';

  @override
  String get add => 'Add';

  @override
  String get back => 'Back';

  @override
  String get close => 'Close';

  @override
  String get notSet => 'Not set';

  @override
  String get loading => 'Loading…';

  @override
  String get addSupply => 'Add supply';

  @override
  String get addDevice => 'Add device';

  @override
  String get addTask => 'Add schedule';

  @override
  String get scanSupply => 'Scan supply';

  @override
  String get scan => 'Scan';

  @override
  String get settings => 'Settings';

  @override
  String get inventoryTitle => 'Supplies';

  @override
  String get inventorySubtitle => 'On hand, low stock, and replacement dates.';

  @override
  String get searchInventory => 'Search supplies';

  @override
  String get allSupplies => 'All';

  @override
  String get lowOnly => 'Low';

  @override
  String get dueOnly => 'Due';

  @override
  String get inventoryEmpty => 'No supplies yet';

  @override
  String get inventoryEmptyDescription => 'Scan a barcode or add the first supply manually.';

  @override
  String get quantityLabel => 'Quantity';

  @override
  String get reorderAtLabel => 'Reorder at';

  @override
  String get replacementCadenceLabel => 'Replace every';

  @override
  String get replacementCadenceDays => 'Cadence in days';

  @override
  String get replacementDue => 'Replacement due';

  @override
  String get nextReplacement => 'Next replacement';

  @override
  String get lastReplacement => 'Last replacement';

  @override
  String get expirationDate => 'Expiration date';

  @override
  String get lotNumber => 'Lot number';

  @override
  String get unitLabel => 'Unit name';

  @override
  String get storageLocation => 'Storage location';

  @override
  String get barcode => 'Barcode';

  @override
  String get brand => 'Brand';

  @override
  String get modelNumber => 'Model number';

  @override
  String get notes => 'Notes';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Archive';

  @override
  String get edit => 'Edit';

  @override
  String get done => 'Done';

  @override
  String get tryAgain => 'Try again';

  @override
  String get supplyName => 'Supply name';

  @override
  String get newSupplyTitle => 'New supply';

  @override
  String get editSupplyTitle => 'Edit supply';

  @override
  String get supplyDetails => 'Supply details';

  @override
  String get category => 'Category';

  @override
  String get itemUnitHint => 'filter, box, bottle...';

  @override
  String get optional => 'Optional';

  @override
  String get requiredField => 'This field is required.';

  @override
  String get positiveWholeNumber => 'Enter zero or a whole number.';

  @override
  String get positiveCadence => 'Enter at least one day.';

  @override
  String get supplySaved => 'Supply saved.';

  @override
  String get supplyArchived => 'Supply archived.';

  @override
  String get stockUpdated => 'Inventory updated.';

  @override
  String get markReplaced => 'Mark replaced';

  @override
  String get replacementRecorded => 'Replacement recorded.';

  @override
  String get stockIn => 'Stock in';

  @override
  String get useOne => 'Use one';

  @override
  String get adjust => 'Adjust';

  @override
  String get scheduleTitle => 'Schedule';

  @override
  String get scheduleSubtitle => 'Cleaning, replacement, and maintenance.';

  @override
  String get scheduleEmpty => 'Nothing scheduled yet';

  @override
  String get scheduleEmptyDescription => 'Create a cleaning, replacement, or maintenance cadence.';

  @override
  String get overdue => 'Overdue';

  @override
  String get today => 'Today';

  @override
  String get nextSevenDays => 'Next 7 days';

  @override
  String get later => 'Later';

  @override
  String get completeTask => 'Complete';

  @override
  String get taskCompleted => 'Task completed. The next date is scheduled.';

  @override
  String get taskTitle => 'Task name';

  @override
  String get newTaskTitle => 'New schedule';

  @override
  String get editTaskTitle => 'Edit schedule';

  @override
  String get taskType => 'Task type';

  @override
  String get cadenceDays => 'Repeat every (days)';

  @override
  String get nextDueDate => 'Next due date';

  @override
  String get reminders => 'Reminders';

  @override
  String get remindersDescription => 'Notifications appear at the time you choose.';

  @override
  String get reminderTime => 'Reminder time';

  @override
  String get notificationPermissionDenied =>
      'Notifications are off. Your schedule still works in the app.';

  @override
  String get taskSaved => 'Schedule saved.';

  @override
  String get devicesTitle => 'Devices';

  @override
  String get devicesSubtitle => 'Identity, support, and reference settings when you need them.';

  @override
  String get devicesEmpty => 'Add your first device';

  @override
  String get devicesEmptyDescription =>
      'Keep the model, serial number, supplier, and setup notes together.';

  @override
  String get deviceName => 'Device name';

  @override
  String get newDeviceTitle => 'New device';

  @override
  String get editDeviceTitle => 'Edit device';

  @override
  String get deviceCategory => 'Device type';

  @override
  String get manufacturer => 'Manufacturer';

  @override
  String get serialNumber => 'Serial number';

  @override
  String get installedAt => 'Started using';

  @override
  String get warrantyExpiresAt => 'Warranty expires';

  @override
  String get supplier => 'Supplier or DME provider';

  @override
  String get manualUrl => 'Manual or support URL';

  @override
  String get deviceInformation => 'Device information';

  @override
  String get prescriptionReference => 'Prescription and setup reference';

  @override
  String get prescriptionSafety =>
      'For reference only. Follow your clinician and device instructions before changing therapy settings.';

  @override
  String get therapyMode => 'Mode';

  @override
  String get minimumPressure => 'Minimum pressure';

  @override
  String get maximumPressure => 'Maximum pressure';

  @override
  String get pressureUnit => 'Pressure unit';

  @override
  String get humidifierSetting => 'Humidifier setting';

  @override
  String get rampMinutes => 'Ramp minutes';

  @override
  String get prescribedBy => 'Prescribed by';

  @override
  String get prescribedAt => 'Prescription date';

  @override
  String get prescriptionNotes => 'Prescription notes';

  @override
  String get deviceSaved => 'Device saved.';

  @override
  String get deviceArchived => 'Device archived.';

  @override
  String get linkedDevice => 'Linked device';

  @override
  String get linkedSupply => 'Linked supply';

  @override
  String get noLink => 'No link';

  @override
  String get scanTitle => 'Scan a supply';

  @override
  String get scanInstruction => 'Center a UPC, EAN, QR, or DataMatrix code inside the frame.';

  @override
  String get cameraPermissionTitle => 'Camera access is optional';

  @override
  String get cameraPermissionDescription =>
      'CareCache uses the camera only while you scan. You can always enter the barcode manually.';

  @override
  String get openScanner => 'Open scanner';

  @override
  String get enterManually => 'Enter manually';

  @override
  String get torch => 'Flashlight';

  @override
  String get scannerError => 'The scanner could not start. You can enter the barcode manually.';

  @override
  String get unknownBarcode => 'New barcode';

  @override
  String get unknownBarcodeDescription =>
      'CareCache has not seen this code on your device. Add the details once and future scans will recognize it.';

  @override
  String get scanLabel => 'Capture label text';

  @override
  String get scanLabelDescription =>
      'Take a photo and review on-device text suggestions before saving.';

  @override
  String get labelCaptureFailed =>
      'CareCache could not read that label. You can still enter the details manually.';

  @override
  String get labelSuggestions => 'Label suggestions';

  @override
  String get useSuggestion => 'Use suggestions';

  @override
  String get recognizedText => 'Recognized text';

  @override
  String get labelSuggestionsApplied => 'Label suggestions added. Review them before saving.';

  @override
  String get settingsTitle => 'Privacy and backup';

  @override
  String get settingsSubtitle => 'Your records stay yours.';

  @override
  String get backupTitle => 'Portable backup';

  @override
  String get backupDescription =>
      'Export a checksum-validated file to local storage or any file provider installed on this device.';

  @override
  String get exportBackup => 'Export backup';

  @override
  String get restoreBackup => 'Restore backup';

  @override
  String get backupReady => 'Backup ready to share.';

  @override
  String get backupFailed => 'The backup could not be created.';

  @override
  String get restoreWarningTitle => 'Replace current CareCache data?';

  @override
  String get restoreWarningDescription =>
      'CareCache validates the entire backup first. A valid restore replaces the data currently on this device.';

  @override
  String get restore => 'Restore';

  @override
  String get restoreComplete => 'Backup restored.';

  @override
  String get restoreFailed => 'That file is not a valid supported CareCache backup.';

  @override
  String get appearance => 'Appearance';

  @override
  String get systemTheme => 'Use device setting';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacySummary =>
      'No accounts, ads, analytics, or hidden cloud. Camera, photos, notifications, and backup are optional.';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get termsOfService => 'Terms of service';

  @override
  String get support => 'Support';

  @override
  String get about => 'About CareCache';

  @override
  String get workingNameNotice => 'CareCache is a working product name from Vector42.';

  @override
  String get offlineStatus => 'Works offline';

  @override
  String get notMedicalAdvice =>
      'CareCache organizes information you enter. It does not provide medical advice.';

  @override
  String get careTaskNotificationBody => 'A scheduled task is due.';

  @override
  String get notificationChannelName => 'Maintenance schedules';

  @override
  String get notificationChannelDescription =>
      'Reminders for cleaning, replacing, and maintaining supplies and devices.';

  @override
  String get unexpectedError => 'Something went wrong. Your saved data was not changed.';

  @override
  String get archivingConfirmation =>
      'Archive this record? Its history will remain available in backups.';

  @override
  String get noResults => 'No supplies match that search.';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0';
  }

  @override
  String lowStockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count low-stock items',
      one: '1 low-stock item',
      zero: 'No low-stock items',
    );
    return '$_temp0';
  }

  @override
  String taskCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count scheduled tasks',
      one: '1 scheduled task',
      zero: 'No scheduled tasks',
    );
    return '$_temp0';
  }

  @override
  String overdueCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count overdue tasks',
      one: '1 overdue task',
      zero: 'Nothing overdue',
    );
    return '$_temp0';
  }

  @override
  String deviceCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count devices',
      one: '1 device',
      zero: 'No devices',
    );
    return '$_temp0';
  }

  @override
  String daysValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String quantityValue(int count, String unit) {
    return '$count $unit';
  }

  @override
  String dueDateValue(String date) {
    return 'Due $date';
  }

  @override
  String repeatsEvery(String cadence) {
    return 'Repeats every $cadence';
  }

  @override
  String get categoryCpap => 'CPAP';

  @override
  String get categoryRespiratory => 'Respiratory';

  @override
  String get categoryDiabetes => 'Diabetes';

  @override
  String get categoryWoundCare => 'Wound care';

  @override
  String get categoryMobility => 'Mobility';

  @override
  String get categoryMedicationAccessory => 'Medication accessory';

  @override
  String get categoryProtective => 'Protective';

  @override
  String get categoryDiagnostic => 'Diagnostic';

  @override
  String get categoryNutrition => 'Nutrition';

  @override
  String get categoryContinence => 'Continence';

  @override
  String get categoryOther => 'Other';

  @override
  String get deviceCpap => 'CPAP or PAP';

  @override
  String get deviceOxygen => 'Oxygen equipment';

  @override
  String get deviceNebulizer => 'Nebulizer';

  @override
  String get deviceGlucoseMeter => 'Glucose meter';

  @override
  String get deviceBloodPressureMonitor => 'Blood pressure monitor';

  @override
  String get deviceMobilityAid => 'Mobility aid';

  @override
  String get deviceInfusion => 'Infusion device';

  @override
  String get deviceOther => 'Other device';

  @override
  String get taskClean => 'Clean';

  @override
  String get taskInspect => 'Inspect';

  @override
  String get taskReplace => 'Replace';

  @override
  String get taskReorder => 'Reorder';

  @override
  String get taskCharge => 'Charge';

  @override
  String get taskCustom => 'Custom';
}
