# Releasing CareCache

The release workflow builds only an existing `vMAJOR.MINOR.PATCH` tag whose version matches the
`pubspec.yaml` build name. It never creates a tag and never releases an arbitrary branch SHA.

## Accounts and identifiers

- Android application ID: `com.vector42.carecache`
- Apple bundle ID: `com.vector42.carecache`
- Publisher: Vector42

The first store setup still requires legal agreements, app records, privacy answers, age/content
ratings, screenshots, support URLs, Play App Signing, an Apple distribution certificate, and an
App Store provisioning profile.

## GitHub environments

Create `mobile-release` with required reviewers and these secrets:

- `CARECACHE_ANDROID_KEYSTORE_BASE64`
- `CARECACHE_ANDROID_KEYSTORE_PASSWORD`
- `CARECACHE_ANDROID_KEY_ALIAS`
- `CARECACHE_ANDROID_KEY_PASSWORD`
- `IOS_DISTRIBUTION_CERTIFICATE_BASE64`
- `IOS_DISTRIBUTION_CERTIFICATE_PASSWORD`
- `IOS_PROVISIONING_PROFILE_BASE64`
- `IOS_TEAM_ID`

Create `mobile-beta` with required reviewers and:

- `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_BASE64`
- `APP_STORE_CONNECT_ISSUER_ID`
- `APP_STORE_CONNECT_KEY_ID`
- `APP_STORE_CONNECT_PRIVATE_KEY_BASE64`
- optional variable `TESTFLIGHT_INTERNAL_GROUP`

## Release flow

1. Update `pubspec.yaml` to `MAJOR.MINOR.PATCH+localBuild` and finish release notes.
2. Run all local verification and confirm privacy/store disclosures.
3. Create and push `vMAJOR.MINOR.PATCH`.
4. The workflow verifies, signs, checks signatures, and creates a draft GitHub release.
5. After store accounts exist, manually dispatch the same tag with `deploy_beta=true` to upload to
   Play Internal and TestFlight. Production promotion remains a deliberate store-console action.

Never place signing files, API keys, service-account JSON, private backups, or real medical data in
the repository or Actions artifacts.
