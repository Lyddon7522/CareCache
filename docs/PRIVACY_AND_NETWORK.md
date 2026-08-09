# Privacy and network boundary

## Default behavior

CareCache has no account, backend, advertising, analytics, crash reporting, tracking SDK, or
background product lookup. The app remains useful in airplane mode.

The following data stays in the application sandbox until the user explicitly exports it:

- Inventory, maintenance, replacement, and completion history.
- Device identity, serial/model, supplier, warranty, and prescription reference fields.
- Barcodes, OCR suggestions, notes, and photos.
- Preferences and local notification identifiers.

## Optional permissions

| Permission | Why | Manual fallback |
| --- | --- | --- |
| Camera | Scan a barcode or capture a label | Type the barcode and details |
| Photos | Choose an existing label image | Type the details |
| Notifications | Remind about user-created tasks | Review Schedule in the app |
| Files/share | Export or select a backup | Continue using local data |

Permission denial never blocks unrelated app features.

## On-device processing

Barcode recognition uses ZXing C++ through the Flutter-team camera implementation. Label OCR uses
the bundled Tesseract English model on Android and Apple's Vision framework on iOS. These paths do
not require an account or network connection, and CareCache does not upload the image or recognized
text. This statement must be re-verified against pinned platform packages before each release.

## User-initiated network and external apps

CareCache may open a URL only after the user taps a supplier, manual, privacy, terms, or support
link. The destination then follows the browser or external app's policies. A backup shared to a
cloud provider is transferred by the operating system and that provider, not by Vector42.

## Future network features

Recall lookup, catalog lookup, and synchronization require a separate design review, explicit
opt-in, updated public disclosures, and a useful offline fallback. They are prohibited until that
review is complete.
