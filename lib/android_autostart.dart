import 'android_autostart_platform_interface.dart';

class AndroidAutostart {
  static Future<bool> navigateAutoStartSetting() {
    return AndroidAutostartPlatform.instance.navigateAutoStartSetting();
  }

  static Future<bool> get autoStartSettingIsAvailable {
    return AndroidAutostartPlatform.instance.autoStartSettingIsAvailable;
  }

  static Future<bool> customSetComponent({
    String? manufacturer,
    String? pkg,
    String? cls,
  }) {
    return AndroidAutostartPlatform.instance.customSetComponent(
      manufacturer: manufacturer,
      pkg: pkg,
      cls: cls,
    );
  }
}
