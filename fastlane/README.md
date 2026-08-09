# CareCache release lanes

The lanes upload existing signed artifacts; signing and builds stay in GitHub Actions.

- `bundle exec fastlane android beta` uploads `CARECACHE_ANDROID_AAB_PATH` to Play Internal.
- `bundle exec fastlane ios beta` uploads `CARECACHE_IOS_IPA_PATH` to TestFlight.

Both fail closed when required credentials or files are absent. Store metadata and screenshots are
intentionally not uploaded until the store accounts and listings exist.
