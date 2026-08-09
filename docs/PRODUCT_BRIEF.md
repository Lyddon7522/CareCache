# CareCache product brief

## Promise

CareCache helps someone answer three questions without opening a cabinet:

1. What medical supplies do I have?
2. What needs attention next?
3. What information will I need when I order, travel, call support, or replace a device?

## Primary user

The first user manages a CPAP machine at home and keeps filters, cushions, masks, headgear, hoses,
water chambers, wipes, and other supplies with different cleaning and replacement cadences. The
broader product supports anyone managing durable medical equipment and recurring home-care stock.

## MVP capabilities

- Inventory with quantity, reorder threshold, storage location, expiration, lot, barcode, and
  replacement cadence.
- Scan in, scan out, and unknown-barcode onboarding.
- On-device label text capture to suggest item details, with user review before saving.
- Cleaning, inspection, replacement, reorder, charging, and custom schedules.
- Local notifications with manual completion history.
- Device identity, warranty, supplier, manual, serial/model, and reference prescription settings.
- Overview for due work, low stock, expiring stock, and next actions.
- Versioned, checksum-validated backup through the system share/file surfaces.
- Static privacy, terms, and support pages for store listings.

## Important next ideas

- Multiple local care profiles for a household, without accounts.
- Inventory lots and package conversions, such as one box containing six filters.
- GS1 DataMatrix parsing for GTIN, lot, and expiration fields.
- Travel-kit and emergency-readiness checklists.
- Order history, preferred supplier, insurance/DME notes, and prescription-renewal reminders.
- Replacement history that learns actual consumption and estimates run-out dates locally.
- Attachment vault for manuals, receipts, prescriptions, and warranty documents.
- Device-specific templates that are editable and clearly attributed, never silent medical
  defaults.
- Optional app lock and encrypted backups.
- Opt-in recall lookup as a separate network feature with explicit disclosure. It is not part of
  the offline MVP.

## Out of scope for the first release

- Accounts, social features, ads, analytics, or cross-device synchronization.
- Clinical recommendations, diagnosis, therapy changes, adherence scoring, or insurer submission.
- Background product lookup, price comparison, or any hidden network request.
- Automatic cloud storage controlled by Vector42.

## Success measures without tracking

CareCache will not collect telemetry. Product quality is evaluated through opt-in user feedback,
manual usability sessions, store reviews, issue reports, and local test fixtures.
