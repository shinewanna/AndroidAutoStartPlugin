import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_autostart_method_channel.dart';

abstract class AndroidAutostartPlatform extends PlatformInterface {
  /// Constructs a AndroidAutostartPlatform.
  AndroidAutostartPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidAutostartPlatform _instance = MethodChannelAndroidAutostart();

  /// The default instance of [AndroidAutostartPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidAutostart].
  static AndroidAutostartPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidAutostartPlatform] when
  /// they register themselves.
  static set instance(AndroidAutostartPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  UnimplementedError get _unimplmentedError =>
      UnimplementedError('platformVersion() has not been implemented.');

  Future<bool> navigateAutoStartSetting() => throw _unimplmentedError;

  Future<bool> get autoStartSettingIsAvailable => throw _unimplmentedError;

  Future<bool> customSetComponent({
    String? manufacturer,
    String? pkg,
    String? cls,
  }) =>
      throw _unimplmentedError;
}
