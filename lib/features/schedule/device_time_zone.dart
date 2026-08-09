import 'package:flutter/services.dart';

abstract final class DeviceTimeZone {
  static const _channel = MethodChannel('com.vector42.carecache/platform');

  static Future<String> identifier() async {
    final identifier = await _channel.invokeMethod<String>('getTimeZoneIdentifier');
    if (identifier == null || identifier.trim().isEmpty) {
      throw PlatformException(
        code: 'timezone_unavailable',
        message: 'The device did not provide a time zone identifier.',
      );
    }
    return identifier;
  }
}
