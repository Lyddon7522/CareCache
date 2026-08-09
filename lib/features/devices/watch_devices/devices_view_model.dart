import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../core/cqrs/mediator.dart';
import '../device.dart';
import 'watch_devices.dart';

final class DevicesViewModel extends ChangeNotifier {
  DevicesViewModel(Mediator mediator) {
    _subscription = mediator
        .query(const WatchDevicesQuery())
        .listen(
          (devices) {
            _devices = devices;
            _loading = false;
            _error = null;
            notifyListeners();
          },
          onError: (Object error) {
            _loading = false;
            _error = error;
            notifyListeners();
          },
        );
  }

  late final StreamSubscription<List<MedicalDevice>> _subscription;
  List<MedicalDevice> _devices = const <MedicalDevice>[];
  bool _loading = true;
  Object? _error;

  List<MedicalDevice> get devices => _devices;
  bool get loading => _loading;
  Object? get error => _error;

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }
}
