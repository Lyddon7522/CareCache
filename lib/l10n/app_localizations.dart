import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'CareCache'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Know what you have. Know what is next.'**
  String get tagline;

  /// No description provided for @navigationOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get navigationOverview;

  /// No description provided for @navigationInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get navigationInventory;

  /// No description provided for @navigationSchedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get navigationSchedule;

  /// No description provided for @navigationDevices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get navigationDevices;

  /// No description provided for @overviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overviewTitle;

  /// No description provided for @nothingNeedsAttention.
  ///
  /// In en, this message translates to:
  /// **'Nothing needs attention'**
  String get nothingNeedsAttention;

  /// No description provided for @nothingNeedsAttentionDescription.
  ///
  /// In en, this message translates to:
  /// **'No overdue tasks or low-stock supplies.'**
  String get nothingNeedsAttentionDescription;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Add your first item'**
  String get getStarted;

  /// No description provided for @needsAttention.
  ///
  /// In en, this message translates to:
  /// **'Needs attention'**
  String get needsAttention;

  /// No description provided for @dueSoon.
  ///
  /// In en, this message translates to:
  /// **'Due soon'**
  String get dueSoon;

  /// No description provided for @lowStock.
  ///
  /// In en, this message translates to:
  /// **'Low stock'**
  String get lowStock;

  /// No description provided for @nextUp.
  ///
  /// In en, this message translates to:
  /// **'Next up'**
  String get nextUp;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Add or scan'**
  String get quickActions;

  /// No description provided for @statusSummary.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusSummary;

  /// No description provided for @scheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get scheduled;

  /// No description provided for @onHand.
  ///
  /// In en, this message translates to:
  /// **'On hand'**
  String get onHand;

  /// No description provided for @inStock.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get inStock;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @notSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get notSet;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get loading;

  /// No description provided for @addSupply.
  ///
  /// In en, this message translates to:
  /// **'Add supply'**
  String get addSupply;

  /// No description provided for @addDevice.
  ///
  /// In en, this message translates to:
  /// **'Add device'**
  String get addDevice;

  /// No description provided for @addTask.
  ///
  /// In en, this message translates to:
  /// **'Add schedule'**
  String get addTask;

  /// No description provided for @scanSupply.
  ///
  /// In en, this message translates to:
  /// **'Scan supply'**
  String get scanSupply;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @inventoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Supplies'**
  String get inventoryTitle;

  /// No description provided for @inventorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'On hand, low stock, and replacement dates.'**
  String get inventorySubtitle;

  /// No description provided for @searchInventory.
  ///
  /// In en, this message translates to:
  /// **'Search supplies'**
  String get searchInventory;

  /// No description provided for @allSupplies.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allSupplies;

  /// No description provided for @lowOnly.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get lowOnly;

  /// No description provided for @dueOnly.
  ///
  /// In en, this message translates to:
  /// **'Due'**
  String get dueOnly;

  /// No description provided for @inventoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No supplies yet'**
  String get inventoryEmpty;

  /// No description provided for @inventoryEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'Scan a barcode or add the first supply manually.'**
  String get inventoryEmptyDescription;

  /// No description provided for @quantityLabel.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantityLabel;

  /// No description provided for @reorderAtLabel.
  ///
  /// In en, this message translates to:
  /// **'Reorder at'**
  String get reorderAtLabel;

  /// No description provided for @replacementCadenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Replace every'**
  String get replacementCadenceLabel;

  /// No description provided for @replacementCadenceDays.
  ///
  /// In en, this message translates to:
  /// **'Cadence in days'**
  String get replacementCadenceDays;

  /// No description provided for @replacementDue.
  ///
  /// In en, this message translates to:
  /// **'Replacement due'**
  String get replacementDue;

  /// No description provided for @nextReplacement.
  ///
  /// In en, this message translates to:
  /// **'Next replacement'**
  String get nextReplacement;

  /// No description provided for @lastReplacement.
  ///
  /// In en, this message translates to:
  /// **'Last replacement'**
  String get lastReplacement;

  /// No description provided for @expirationDate.
  ///
  /// In en, this message translates to:
  /// **'Expiration date'**
  String get expirationDate;

  /// No description provided for @lotNumber.
  ///
  /// In en, this message translates to:
  /// **'Lot number'**
  String get lotNumber;

  /// No description provided for @unitLabel.
  ///
  /// In en, this message translates to:
  /// **'Unit name'**
  String get unitLabel;

  /// No description provided for @storageLocation.
  ///
  /// In en, this message translates to:
  /// **'Storage location'**
  String get storageLocation;

  /// No description provided for @barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcode;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @modelNumber.
  ///
  /// In en, this message translates to:
  /// **'Model number'**
  String get modelNumber;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @supplyName.
  ///
  /// In en, this message translates to:
  /// **'Supply name'**
  String get supplyName;

  /// No description provided for @newSupplyTitle.
  ///
  /// In en, this message translates to:
  /// **'New supply'**
  String get newSupplyTitle;

  /// No description provided for @editSupplyTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit supply'**
  String get editSupplyTitle;

  /// No description provided for @supplyDetails.
  ///
  /// In en, this message translates to:
  /// **'Supply details'**
  String get supplyDetails;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @itemUnitHint.
  ///
  /// In en, this message translates to:
  /// **'filter, box, bottle...'**
  String get itemUnitHint;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get requiredField;

  /// No description provided for @positiveWholeNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter zero or a whole number.'**
  String get positiveWholeNumber;

  /// No description provided for @positiveCadence.
  ///
  /// In en, this message translates to:
  /// **'Enter at least one day.'**
  String get positiveCadence;

  /// No description provided for @supplySaved.
  ///
  /// In en, this message translates to:
  /// **'Supply saved.'**
  String get supplySaved;

  /// No description provided for @supplyArchived.
  ///
  /// In en, this message translates to:
  /// **'Supply archived.'**
  String get supplyArchived;

  /// No description provided for @stockUpdated.
  ///
  /// In en, this message translates to:
  /// **'Inventory updated.'**
  String get stockUpdated;

  /// No description provided for @markReplaced.
  ///
  /// In en, this message translates to:
  /// **'Mark replaced'**
  String get markReplaced;

  /// No description provided for @replacementRecorded.
  ///
  /// In en, this message translates to:
  /// **'Replacement recorded.'**
  String get replacementRecorded;

  /// No description provided for @stockIn.
  ///
  /// In en, this message translates to:
  /// **'Stock in'**
  String get stockIn;

  /// No description provided for @useOne.
  ///
  /// In en, this message translates to:
  /// **'Use one'**
  String get useOne;

  /// No description provided for @adjust.
  ///
  /// In en, this message translates to:
  /// **'Adjust'**
  String get adjust;

  /// No description provided for @scheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get scheduleTitle;

  /// No description provided for @scheduleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cleaning, replacement, and maintenance.'**
  String get scheduleSubtitle;

  /// No description provided for @scheduleEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing scheduled yet'**
  String get scheduleEmpty;

  /// No description provided for @scheduleEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'Create a cleaning, replacement, or maintenance cadence.'**
  String get scheduleEmptyDescription;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdue;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @nextSevenDays.
  ///
  /// In en, this message translates to:
  /// **'Next 7 days'**
  String get nextSevenDays;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @completeTask.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get completeTask;

  /// No description provided for @taskCompleted.
  ///
  /// In en, this message translates to:
  /// **'Task completed. The next date is scheduled.'**
  String get taskCompleted;

  /// No description provided for @taskTitle.
  ///
  /// In en, this message translates to:
  /// **'Task name'**
  String get taskTitle;

  /// No description provided for @newTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'New schedule'**
  String get newTaskTitle;

  /// No description provided for @editTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit schedule'**
  String get editTaskTitle;

  /// No description provided for @taskType.
  ///
  /// In en, this message translates to:
  /// **'Task type'**
  String get taskType;

  /// No description provided for @cadenceDays.
  ///
  /// In en, this message translates to:
  /// **'Repeat every (days)'**
  String get cadenceDays;

  /// No description provided for @nextDueDate.
  ///
  /// In en, this message translates to:
  /// **'Next due date'**
  String get nextDueDate;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @remindersDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifications appear at the time you choose.'**
  String get remindersDescription;

  /// No description provided for @reminderTime.
  ///
  /// In en, this message translates to:
  /// **'Reminder time'**
  String get reminderTime;

  /// No description provided for @notificationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Notifications are off. Your schedule still works in the app.'**
  String get notificationPermissionDenied;

  /// No description provided for @taskSaved.
  ///
  /// In en, this message translates to:
  /// **'Schedule saved.'**
  String get taskSaved;

  /// No description provided for @devicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get devicesTitle;

  /// No description provided for @devicesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identity, support, and reference settings when you need them.'**
  String get devicesSubtitle;

  /// No description provided for @devicesEmpty.
  ///
  /// In en, this message translates to:
  /// **'Add your first device'**
  String get devicesEmpty;

  /// No description provided for @devicesEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'Keep the model, serial number, supplier, and setup notes together.'**
  String get devicesEmptyDescription;

  /// No description provided for @deviceName.
  ///
  /// In en, this message translates to:
  /// **'Device name'**
  String get deviceName;

  /// No description provided for @newDeviceTitle.
  ///
  /// In en, this message translates to:
  /// **'New device'**
  String get newDeviceTitle;

  /// No description provided for @editDeviceTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit device'**
  String get editDeviceTitle;

  /// No description provided for @deviceCategory.
  ///
  /// In en, this message translates to:
  /// **'Device type'**
  String get deviceCategory;

  /// No description provided for @manufacturer.
  ///
  /// In en, this message translates to:
  /// **'Manufacturer'**
  String get manufacturer;

  /// No description provided for @serialNumber.
  ///
  /// In en, this message translates to:
  /// **'Serial number'**
  String get serialNumber;

  /// No description provided for @installedAt.
  ///
  /// In en, this message translates to:
  /// **'Started using'**
  String get installedAt;

  /// No description provided for @warrantyExpiresAt.
  ///
  /// In en, this message translates to:
  /// **'Warranty expires'**
  String get warrantyExpiresAt;

  /// No description provided for @supplier.
  ///
  /// In en, this message translates to:
  /// **'Supplier or DME provider'**
  String get supplier;

  /// No description provided for @manualUrl.
  ///
  /// In en, this message translates to:
  /// **'Manual or support URL'**
  String get manualUrl;

  /// No description provided for @deviceInformation.
  ///
  /// In en, this message translates to:
  /// **'Device information'**
  String get deviceInformation;

  /// No description provided for @prescriptionReference.
  ///
  /// In en, this message translates to:
  /// **'Prescription and setup reference'**
  String get prescriptionReference;

  /// No description provided for @prescriptionSafety.
  ///
  /// In en, this message translates to:
  /// **'For reference only. Follow your clinician and device instructions before changing therapy settings.'**
  String get prescriptionSafety;

  /// No description provided for @therapyMode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get therapyMode;

  /// No description provided for @minimumPressure.
  ///
  /// In en, this message translates to:
  /// **'Minimum pressure'**
  String get minimumPressure;

  /// No description provided for @maximumPressure.
  ///
  /// In en, this message translates to:
  /// **'Maximum pressure'**
  String get maximumPressure;

  /// No description provided for @pressureUnit.
  ///
  /// In en, this message translates to:
  /// **'Pressure unit'**
  String get pressureUnit;

  /// No description provided for @humidifierSetting.
  ///
  /// In en, this message translates to:
  /// **'Humidifier setting'**
  String get humidifierSetting;

  /// No description provided for @rampMinutes.
  ///
  /// In en, this message translates to:
  /// **'Ramp minutes'**
  String get rampMinutes;

  /// No description provided for @prescribedBy.
  ///
  /// In en, this message translates to:
  /// **'Prescribed by'**
  String get prescribedBy;

  /// No description provided for @prescribedAt.
  ///
  /// In en, this message translates to:
  /// **'Prescription date'**
  String get prescribedAt;

  /// No description provided for @prescriptionNotes.
  ///
  /// In en, this message translates to:
  /// **'Prescription notes'**
  String get prescriptionNotes;

  /// No description provided for @deviceSaved.
  ///
  /// In en, this message translates to:
  /// **'Device saved.'**
  String get deviceSaved;

  /// No description provided for @deviceArchived.
  ///
  /// In en, this message translates to:
  /// **'Device archived.'**
  String get deviceArchived;

  /// No description provided for @linkedDevice.
  ///
  /// In en, this message translates to:
  /// **'Linked device'**
  String get linkedDevice;

  /// No description provided for @linkedSupply.
  ///
  /// In en, this message translates to:
  /// **'Linked supply'**
  String get linkedSupply;

  /// No description provided for @noLink.
  ///
  /// In en, this message translates to:
  /// **'No link'**
  String get noLink;

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan a supply'**
  String get scanTitle;

  /// No description provided for @scanInstruction.
  ///
  /// In en, this message translates to:
  /// **'Center a UPC, EAN, QR, or DataMatrix code inside the frame.'**
  String get scanInstruction;

  /// No description provided for @cameraPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera access is optional'**
  String get cameraPermissionTitle;

  /// No description provided for @cameraPermissionDescription.
  ///
  /// In en, this message translates to:
  /// **'CareCache uses the camera only while you scan. You can always enter the barcode manually.'**
  String get cameraPermissionDescription;

  /// No description provided for @openScanner.
  ///
  /// In en, this message translates to:
  /// **'Open scanner'**
  String get openScanner;

  /// No description provided for @enterManually.
  ///
  /// In en, this message translates to:
  /// **'Enter manually'**
  String get enterManually;

  /// No description provided for @torch.
  ///
  /// In en, this message translates to:
  /// **'Flashlight'**
  String get torch;

  /// No description provided for @scannerError.
  ///
  /// In en, this message translates to:
  /// **'The scanner could not start. You can enter the barcode manually.'**
  String get scannerError;

  /// No description provided for @unknownBarcode.
  ///
  /// In en, this message translates to:
  /// **'New barcode'**
  String get unknownBarcode;

  /// No description provided for @unknownBarcodeDescription.
  ///
  /// In en, this message translates to:
  /// **'CareCache has not seen this code on your device. Add the details once and future scans will recognize it.'**
  String get unknownBarcodeDescription;

  /// No description provided for @scanLabel.
  ///
  /// In en, this message translates to:
  /// **'Capture label text'**
  String get scanLabel;

  /// No description provided for @scanLabelDescription.
  ///
  /// In en, this message translates to:
  /// **'Take a photo and review on-device text suggestions before saving.'**
  String get scanLabelDescription;

  /// No description provided for @labelCaptureFailed.
  ///
  /// In en, this message translates to:
  /// **'CareCache could not read that label. You can still enter the details manually.'**
  String get labelCaptureFailed;

  /// No description provided for @labelSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Label suggestions'**
  String get labelSuggestions;

  /// No description provided for @useSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Use suggestions'**
  String get useSuggestion;

  /// No description provided for @recognizedText.
  ///
  /// In en, this message translates to:
  /// **'Recognized text'**
  String get recognizedText;

  /// No description provided for @labelSuggestionsApplied.
  ///
  /// In en, this message translates to:
  /// **'Label suggestions added. Review them before saving.'**
  String get labelSuggestionsApplied;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy and backup'**
  String get settingsTitle;

  /// No description provided for @settingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your records stay yours.'**
  String get settingsSubtitle;

  /// No description provided for @backupTitle.
  ///
  /// In en, this message translates to:
  /// **'Portable backup'**
  String get backupTitle;

  /// No description provided for @backupDescription.
  ///
  /// In en, this message translates to:
  /// **'Export a checksum-validated file to local storage or any file provider installed on this device.'**
  String get backupDescription;

  /// No description provided for @exportBackup.
  ///
  /// In en, this message translates to:
  /// **'Export backup'**
  String get exportBackup;

  /// No description provided for @restoreBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore backup'**
  String get restoreBackup;

  /// No description provided for @backupReady.
  ///
  /// In en, this message translates to:
  /// **'Backup ready to share.'**
  String get backupReady;

  /// No description provided for @backupFailed.
  ///
  /// In en, this message translates to:
  /// **'The backup could not be created.'**
  String get backupFailed;

  /// No description provided for @restoreWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Replace current CareCache data?'**
  String get restoreWarningTitle;

  /// No description provided for @restoreWarningDescription.
  ///
  /// In en, this message translates to:
  /// **'CareCache validates the entire backup first. A valid restore replaces the data currently on this device.'**
  String get restoreWarningDescription;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @restoreComplete.
  ///
  /// In en, this message translates to:
  /// **'Backup restored.'**
  String get restoreComplete;

  /// No description provided for @restoreFailed.
  ///
  /// In en, this message translates to:
  /// **'That file is not a valid supported CareCache backup.'**
  String get restoreFailed;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'Use device setting'**
  String get systemTheme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyTitle;

  /// No description provided for @privacySummary.
  ///
  /// In en, this message translates to:
  /// **'No accounts, ads, analytics, or hidden cloud. Camera, photos, notifications, and backup are optional.'**
  String get privacySummary;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of service'**
  String get termsOfService;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About CareCache'**
  String get about;

  /// No description provided for @workingNameNotice.
  ///
  /// In en, this message translates to:
  /// **'CareCache is a working product name from Vector42.'**
  String get workingNameNotice;

  /// No description provided for @offlineStatus.
  ///
  /// In en, this message translates to:
  /// **'Works offline'**
  String get offlineStatus;

  /// No description provided for @notMedicalAdvice.
  ///
  /// In en, this message translates to:
  /// **'CareCache organizes information you enter. It does not provide medical advice.'**
  String get notMedicalAdvice;

  /// No description provided for @careTaskNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'A scheduled task is due.'**
  String get careTaskNotificationBody;

  /// No description provided for @notificationChannelName.
  ///
  /// In en, this message translates to:
  /// **'Maintenance schedules'**
  String get notificationChannelName;

  /// No description provided for @notificationChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Reminders for cleaning, replacing, and maintaining supplies and devices.'**
  String get notificationChannelDescription;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Your saved data was not changed.'**
  String get unexpectedError;

  /// No description provided for @archivingConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Archive this record? Its history will remain available in backups.'**
  String get archivingConfirmation;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No supplies match that search.'**
  String get noResults;

  /// No description provided for @itemCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No items} =1{1 item} other{{count} items}}'**
  String itemCount(int count);

  /// No description provided for @lowStockCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No low-stock items} =1{1 low-stock item} other{{count} low-stock items}}'**
  String lowStockCount(int count);

  /// No description provided for @taskCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No scheduled tasks} =1{1 scheduled task} other{{count} scheduled tasks}}'**
  String taskCount(int count);

  /// No description provided for @deviceCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No devices} =1{1 device} other{{count} devices}}'**
  String deviceCount(int count);

  /// No description provided for @daysValue.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day} other{{count} days}}'**
  String daysValue(int count);

  /// No description provided for @quantityValue.
  ///
  /// In en, this message translates to:
  /// **'{count} {unit}'**
  String quantityValue(int count, String unit);

  /// No description provided for @dueDateValue.
  ///
  /// In en, this message translates to:
  /// **'Due {date}'**
  String dueDateValue(String date);

  /// No description provided for @categoryCpap.
  ///
  /// In en, this message translates to:
  /// **'CPAP'**
  String get categoryCpap;

  /// No description provided for @categoryRespiratory.
  ///
  /// In en, this message translates to:
  /// **'Respiratory'**
  String get categoryRespiratory;

  /// No description provided for @categoryDiabetes.
  ///
  /// In en, this message translates to:
  /// **'Diabetes'**
  String get categoryDiabetes;

  /// No description provided for @categoryWoundCare.
  ///
  /// In en, this message translates to:
  /// **'Wound care'**
  String get categoryWoundCare;

  /// No description provided for @categoryMobility.
  ///
  /// In en, this message translates to:
  /// **'Mobility'**
  String get categoryMobility;

  /// No description provided for @categoryMedicationAccessory.
  ///
  /// In en, this message translates to:
  /// **'Medication accessory'**
  String get categoryMedicationAccessory;

  /// No description provided for @categoryProtective.
  ///
  /// In en, this message translates to:
  /// **'Protective'**
  String get categoryProtective;

  /// No description provided for @categoryDiagnostic.
  ///
  /// In en, this message translates to:
  /// **'Diagnostic'**
  String get categoryDiagnostic;

  /// No description provided for @categoryNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get categoryNutrition;

  /// No description provided for @categoryContinence.
  ///
  /// In en, this message translates to:
  /// **'Continence'**
  String get categoryContinence;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @deviceCpap.
  ///
  /// In en, this message translates to:
  /// **'CPAP or PAP'**
  String get deviceCpap;

  /// No description provided for @deviceOxygen.
  ///
  /// In en, this message translates to:
  /// **'Oxygen equipment'**
  String get deviceOxygen;

  /// No description provided for @deviceNebulizer.
  ///
  /// In en, this message translates to:
  /// **'Nebulizer'**
  String get deviceNebulizer;

  /// No description provided for @deviceGlucoseMeter.
  ///
  /// In en, this message translates to:
  /// **'Glucose meter'**
  String get deviceGlucoseMeter;

  /// No description provided for @deviceBloodPressureMonitor.
  ///
  /// In en, this message translates to:
  /// **'Blood pressure monitor'**
  String get deviceBloodPressureMonitor;

  /// No description provided for @deviceMobilityAid.
  ///
  /// In en, this message translates to:
  /// **'Mobility aid'**
  String get deviceMobilityAid;

  /// No description provided for @deviceInfusion.
  ///
  /// In en, this message translates to:
  /// **'Infusion device'**
  String get deviceInfusion;

  /// No description provided for @deviceOther.
  ///
  /// In en, this message translates to:
  /// **'Other device'**
  String get deviceOther;

  /// No description provided for @taskClean.
  ///
  /// In en, this message translates to:
  /// **'Clean'**
  String get taskClean;

  /// No description provided for @taskInspect.
  ///
  /// In en, this message translates to:
  /// **'Inspect'**
  String get taskInspect;

  /// No description provided for @taskReplace.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get taskReplace;

  /// No description provided for @taskReorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get taskReorder;

  /// No description provided for @taskCharge.
  ///
  /// In en, this message translates to:
  /// **'Charge'**
  String get taskCharge;

  /// No description provided for @taskCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get taskCustom;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
