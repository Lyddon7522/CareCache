# CareCache backup format

## Goals

- Portable and inspectable by the user.
- Versioned independently from the Drift schema.
- Validated completely before any live write.
- Safe against path traversal, duplicate entries, undeclared content, and checksum corruption.
- Restored atomically.

## Version 1

A `.carecache` file is a ZIP archive containing exactly:

```text
manifest.json
data.json
```

`manifest.json` contains:

- `format`: `carecache-backup`
- `formatVersion`: `1`
- `schemaVersion`: the portable data schema
- `createdAt`: UTC ISO-8601 timestamp
- `dataFile`: `data.json`
- `dataChecksumSha256`: lowercase SHA-256 of the exact `data.json` bytes

`data.json` contains canonical arrays for devices, supplies, inventory events, care tasks, task
completions, and preferences. Dates use UTC ISO-8601 strings. Stable IDs are preserved.

## Restore sequence

1. Decode the ZIP with integrity checks.
2. Reject unsafe, duplicate, missing, or undeclared paths.
3. Parse and validate the manifest and supported versions.
4. Verify the SHA-256 checksum before parsing canonical data.
5. Validate types, stable-ID uniqueness, references, quantities, and dates.
6. Migrate a supported portable schema in memory when needed.
7. Replace live rows in one Drift transaction.
8. Reschedule local notifications from the restored tasks.

Future attachments will be content-addressed blobs declared by checksum in the manifest. They are
not part of format version 1.
