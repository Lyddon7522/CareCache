# Data model

## Version 1 records

### Device

Identity and support information for durable equipment: category, display name, manufacturer,
model, serial number, installation date, warranty date, supplier, manual URL, storage location,
notes, and optional reference prescription/setup fields.

Prescription values are user-entered reference data. CareCache never validates a value as safe or
suggests changing equipment from a saved value.

### Supply

A catalog item plus its current aggregate inventory: category, linked device, name, brand, model,
barcode, lot, expiration, unit label, quantity, reorder point, replacement cadence, last/next
replacement, storage location, image path, and notes.

Aggregate quantity keeps the first release fast. A future migration can split catalog products,
packaging, and inventory lots without changing stable supply IDs.

### Inventory event

An append-only ledger of stock-in, use, adjustment, and replacement deltas. The current quantity
is cached on the supply row and updated in the same transaction.

### Care task and completion

A recurring cleaning, inspection, replacement, reorder, charging, or custom task. Each completion
is retained. Completing a recurring task calculates the next due date from the completion time.

### Preference

A small key/value store for theme, onboarding, and permission explanation state. Sensitive health
records do not belong in preferences.

## Stable identifiers and time

- Records use UUID v4 strings generated on-device.
- Persist timestamps as UTC through Drift and convert to local time only for display and calendar
  calculations.
- A "day" task uses the user's current local time zone. Tests must cover daylight-saving changes.
- Archive records instead of deleting them when they are referenced by history.

## Planned migrations

- Multiple local care profiles and ownership.
- Product/package/lot separation and quantity-unit conversions.
- Versioned prescription-setting history and custom typed device fields.
- Content-addressed attachments.
- Per-task reminder offsets and snooze history.
