# CareCache agent guidance

## Repository map

- The repository root is the Flutter application for Android and iOS. There is intentionally no
  Flutter web target.
- `site/` is the separate static Astro website for public product, support, privacy, and terms
  pages.
- `infra/site/` contains optional Azure Static Web Apps infrastructure.
- Read `README.md` and the relevant document under `docs/` before changing a product boundary,
  persisted format, privacy behavior, platform integration, or release flow.
- Preserve unrelated work and keep generated, editor, signing, and personal-health artifacts out
  of commits.

## Product invariants

- Keep CareCache local-first, fully useful offline, and usable without an account.
- Do not add advertising, analytics, crash reporting, tracking, hidden network traffic, or a
  health-data backend.
- Camera, photo, notification, and file access remain optional. Explain the benefit before asking
  for permission and preserve a manual path when permission is denied.
- Keep the app supply- and device-neutral. CPAP is the first polished workflow, not a product
  boundary.
- CareCache records user-entered information. It must not diagnose, recommend therapy changes, or
  present replacement templates as medical instructions.
- Use only synthetic health, prescription, barcode, serial-number, and inventory data in code,
  tests, screenshots, fixtures, and docs.
- Maintain accessibility: semantic labels, contrast, large text, practical touch targets, dark
  theme, keyboard support on large screens, and reduced-motion-friendly behavior.
- `assets/brand/` and `docs/brand-guidelines.md` are the identity source of truth.
- Never commit credentials, signing material, private backups, real barcodes, or real health data.

## Flutter architecture and style

- Organize product code as vertical slices under `lib/features/<feature>/`. A feature owns its
  models, Drift tables and store, commands, queries, handlers, view models, screens, widgets, and
  tests. Keep foundational files at the feature root. Add operation folders such as `save_supply/`
  or `watch_inventory/` only when they form a useful slice; do not add a generic `shared/` folder
  inside every feature.
- Put code in `lib/core/` only when multiple features genuinely consume it. App startup, routing,
  and dependency registration belong in `lib/app/`. A generic layer containing one feature's code
  is a smell.
- Use lightweight in-process CQRS: commands mutate, queries read or watch, and handlers are
  colocated with the request they handle. The mediator dispatches only; business rules stay in
  feature handlers and stores. Do not introduce separate read databases, event sourcing, or
  eventual consistency without an explicit product need.
- Keep platform calls out of widgets and pure rules. Inject feature stores and services through
  constructors, then register handlers explicitly in app composition.
- Prefer Flutter/Dart-team packages and SDK APIs. Document why a community package is needed for
  every privacy-sensitive platform capability.
- Keep user-visible strings in ARB localization resources.
- Use `go_router` for declarative routes and deep-linkable screens. Use available width, not device
  type or orientation, for adaptive layouts.
- Follow `analysis_options.yaml`: strict typing, single quotes, declared return types, and the
  100-column formatter.

## Persistence and backup

- Read `docs/DATA_MODEL.md` and `docs/BACKUP_FORMAT.md` before changing Drift tables, canonical
  JSON, backups, restores, or migrations.
- Validate an entire backup before changing live data. Restore in one database transaction.
- After Drift schema changes, run `dart run build_runner build --delete-conflicting-outputs`,
  format generated output, and commit it.
- After ARB edits, run `flutter gen-l10n` and commit generated localization output.
- After launcher-source changes, run `dart run tool/generate_icons.dart` and commit platform
  assets.

## Verification

- Add tests at the affected layer. Include denial, corrupt-input, rollback, time-zone/DST, empty,
  and accessibility paths where relevant.
- Before handoff for Flutter changes, run:

  ```sh
  dart format --output=none --set-exit-if-changed lib test integration_test tool
  flutter analyze
  flutter test
  ```

- Run the integration journey and a relevant Android/iOS build for platform-facing changes when a
  simulator or device is available. Report checks that could not run.
