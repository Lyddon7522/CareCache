# Architecture

## Shape

CareCache uses vertical feature slices with lightweight, in-process CQRS. This mirrors the
feature-first organization used in the local CanfieldJoseph, ARS, and FoundryPulse repositories.

```text
View -> ViewModel -> Command or Query -> Mediator -> Feature handler -> Feature store -> Drift
                                                       \-> Feature platform adapter
```

- A feature owns the code required to deliver its workflows, from UI through persistence.
- Commands represent an intention to change state and complete only after Drift commits.
- Queries return a value, future, or live stream shaped for their consumer.
- Handlers hold workflow rules and coordinate a feature store with optional platform side effects.
- The mediator is a small typed dispatcher registered explicitly at startup. It is not a service
  locator and does not contain application rules.
- View models own subscriptions, filters, transient form state, and interaction state. Views render
  state and forward intent.
- Drift is the one local read/write database. CQRS is an organizational boundary, not separate
  storage, event sourcing, asynchronous projection, or eventual consistency.

## Repository layout

```text
lib/
  app/                         # bootstrap, dependency registration, router, app shell
  core/
    cqrs/                      # mediator contracts and dispatcher
    database/                  # Drift connection and schema assembly only
    theme/                     # shared brand tokens and Material themes
    widgets/                   # components proven useful across multiple features
  features/
    inventory/
      supply.dart              # inventory-only model at the feature root
      inventory_tables.dart   # feature-owned Drift declarations
      inventory_store.dart    # feature-owned persistence boundary
      save_supply/             # command, handler, editor/view model
      adjust_inventory/        # command and handler
      mark_supply_replaced/    # command and handler
      watch_inventory/         # query, handler, overview view model/view/widgets
    devices/                   # same operation-oriented convention
    schedule/                  # tasks, completions, and reminder scheduling
    scanner/                   # camera barcode and OCR workflows
    overview/                  # composition of inventory and schedule queries
    settings/                  # preferences, backup/restore, privacy, and about
```

Foundational feature code stays directly at the feature root. An operation receives its own folder
when it has a meaningful command/query, handler, UI, or tests to keep together. Code moves to
`core/` only after at least two features require the same stable abstraction. Cross-feature
composition belongs in the consuming feature; for example, Overview consumes inventory and schedule
queries without taking ownership of either feature's persistence.

Drift requires a single generated database type. Each feature declares its own tables, while
`core/database/app_database.dart` imports and registers them. Optional cross-feature links use
stable string identifiers rather than data-layer imports between feature table definitions.

## Navigation

`go_router` drives a `StatefulShellRoute` with four persistent branches:

- Overview
- Inventory
- Schedule
- Devices

Scanner, editors, details, and settings are routes outside or beneath the shell. Routes remain
deep-linkable. Compact layouts use bottom navigation; wider layouts use a navigation rail based on
available width rather than device type.

## Side-effect ordering

Database changes commit before non-transactional operating-system work. For example, saving a care
schedule first commits the task, then replaces its local notification. If notification scheduling
fails, the task remains visible and the UI can explain that reminders are unavailable. Handlers
must be safe to retry and must not hide a committed record because an optional platform feature was
denied.

## Dependency policy

SDK and Flutter/Dart-team packages are the default. Current justified community dependencies are:

- Drift for typed SQLite persistence, requested for this product.
- `flutter_zxing` because Flutter has no first-party barcode decoder. It uses the Flutter-team
  camera package and a local, open-source ZXing C++ decoder without an analytics SDK.
- Tesseract4Android and Apple's Vision framework behind an in-repository platform channel because
  Flutter has no first-party cross-platform OCR adapter. The English Tesseract model is pinned and
  bundled so Android OCR never downloads a model.
- `flutter_local_notifications` because Flutter has no first-party local scheduling API.
- The Dart Labs `timezone` package provides the IANA database and DST-safe `TZDateTime`. Its own
  documentation explicitly leaves device-zone discovery to applications, so a small platform
  channel reads the current Android/iOS IANA identifier before `timezone` sets its local location.
- `share_plus` for a consistent system share sheet used to place backups in local or cloud file
  providers.
- Small pure-Dart archive, checksum, path, and identifier packages for the portable backup format.

Every platform dependency must be reviewed again before release for privacy manifests, licenses,
minimum OS levels, and hidden network behavior.

ZXing remains the default barcode decoder for the MVP because it supports the retail and matrix
formats CareCache needs without an analytics SDK. Real-device acceptance testing must cover small,
curved, damaged, low-contrast, and poorly lit supply labels. If that benchmark is not reliable,
changing the decoder requires a documented quality comparison and a new privacy/store-disclosure
review; ML Kit is not introduced solely on reputation.

## Storage and cloud

The live database and photos remain in the app sandbox. "Cloud backup" initially means the user
chooses iCloud Drive, Google Drive, OneDrive, or another installed file provider through operating
system surfaces. Vector42 does not receive or host the backup and CareCache needs no account.

## Minimum platforms

- iOS 15.5 for the supported application baseline and current Flutter camera adapter.
- Android 7.0 (API 24) for current plugin support and predictable platform behavior.
- Barcode decoding and label recognition assets are available at first launch and work offline.
