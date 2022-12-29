import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_autostart_platform_interface.dart';

/// An implementation of [AndroidAutostartPlatform] that uses method channels.
class MethodChannelAndroidAutostart extends AndroidAutostartPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_autostart');

  bool _onError(Object? error, StackTrace stackTrace) {
    log(
      'The following error has ocurred:',
      name: 'android_autostart',
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

    return false;
  }

  bool _handleResponse(bool? response) => response ?? false;

  @override
  Future<bool> navigateAutoStartSetting() {
    return methodChannel
        .invokeMethod<bool>('navigateAutoStartSetting')
        .then(_handleResponse)
        .onError(_onError);
  }

  @override
  Future<bool> get autoStartSettingIsAvailable async {
    return methodChannel
        .invokeMethod<bool>('autoStartSettingIsAvailable')
        .then(_handleResponse)
        .onError(_onError);
  }

  @override
  Future<bool> customSetComponent({
    String? manufacturer,
    String? pkg,
    String? cls,
  }) {
    Map<String, String?> args = {
      'manufacturer': manufacturer,
      'pkg': pkg,
      'cls': cls,
    };

    return methodChannel
        .invokeMethod<bool>('customSetComponent', args)
        .then(_handleResponse)
        .onError(_onError);
  }
}
