# CareCache

CareCache is a private, local-first mobile app for keeping home medical supplies and devices ready.
It tracks what is on hand, what is due for cleaning or replacement, and the reference information
that is easy to lose when a device needs attention.

CPAP supplies are the first deeply supported workflow, but the data model is intentionally broad
enough for respiratory, diabetes, wound-care, mobility, diagnostic, nutrition, continence, and
other home-care supplies.

## Product principles

- No account, ads, analytics, or tracking.
- Useful offline from first launch.
- Manual entry always works; camera and notifications are optional accelerators.
- Medical and prescription details are reference records, not treatment advice.
- Portable, versioned backups that the user controls.
- Calm, accessible design with useful overviews instead of a dense admin dashboard.

## Repository

```text
lib/                  Flutter application
  app/                Startup, routing, shell, and dependency composition
  core/               CQRS dispatch, database assembly, theme, and truly shared UI
  features/           Complete vertical slices grouped by product capability
    inventory/        Supply models, Drift store, commands, queries, screens, and widgets
    devices/          Device identity and prescription-reference workflows
    schedule/         Cleaning, replacement, maintenance, and local reminders
    scanner/          Barcode and on-device label capture
    overview/         Cross-feature inventory and schedule overview
    settings/         Privacy, appearance, backup, restore, and about
site/                 Static Astro product and legal site
infra/site/           Optional Azure Static Web Apps infrastructure
assets/brand/         Approved identity source assets
docs/                 Product, architecture, privacy, backup, and brand decisions
```

## Local development

Requirements: Flutter 3.44.8, Dart 3.12.2, Xcode with iOS 15.5 support, Android SDK, Node.js 22,
and npm.

```sh
flutter pub get
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run
```

For the static site:

```sh
cd site
npm ci
npm run verify
```

## Current status

The repository is in MVP foundation development. Store accounts, signing credentials, production
site URLs, formal trademark clearance, and a source-code license are intentionally not configured
yet.

CareCache is a working name owned and published by Vector42. It must receive a formal trademark
and store-name review before release.
