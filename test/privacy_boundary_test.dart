import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('normal app dependencies contain no tracking or backend SDK', () {
    final pubspec = File('pubspec.yaml').readAsStringSync().toLowerCase();
    for (final prohibited in <String>[
      'firebase_analytics',
      'firebase_crashlytics',
      'sentry_flutter',
      'posthog_flutter',
      'amplitude_flutter',
      'mixpanel_flutter',
      'appsflyer',
      'facebook_app_events',
      'google_mlkit',
      'mobile_scanner',
    ]) {
      expect(
        pubspec,
        isNot(contains(prohibited)),
        reason: '$prohibited violates local-first privacy',
      );
    }
  });

  test('Android application does not request general internet access', () {
    final manifest = File('android/app/src/main/AndroidManifest.xml').readAsStringSync();
    expect(manifest, isNot(contains('android.permission.INTERNET')));
    expect(manifest, isNot(contains('com.google.android.gms.permission.AD_ID')));
    for (final removedPermission in <String>[
      'android.permission.RECORD_AUDIO',
      'android.permission.READ_EXTERNAL_STORAGE',
      'android.permission.WRITE_EXTERNAL_STORAGE',
      'android.permission.ACCESS_NETWORK_STATE',
    ]) {
      expect(
        manifest,
        contains('$removedPermission" tools:node="remove"'),
        reason: '$removedPermission is not used by CareCache',
      );
    }
  });

  test('iOS application does not declare tracking permission', () {
    final plist = File('ios/Runner/Info.plist').readAsStringSync();
    expect(plist, isNot(contains('NSUserTrackingUsageDescription')));
  });
}
