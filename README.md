# **Android AutoStart**

This Flutter library allows requesting to enable Auto Start permission for Android Flutter apps.

There are devices manufacturers that don't allow applications auto starts by default. This makes difficult (not to say impossible) to run apps in background on their devices. However, a simple solution for that is show to users the Auto Start Setting screen. The access to that screen varies by manufacturer. Thus, with this plugin is possible navigate to Auto Start Setting screen in a simple way.

<br/>

## **Installation**

Add `android_autostart` to the dependencies list
of the `pubspec.yaml` file as follow:

```yaml
dependencies:
  flutter:
    sdk: flutter

  android_autostart:
    git:
      url: https://github.com/Jeferson505/AndroidAutoStartPlugin.git
      ref: v1.0.0
```

Then run the command `flutter pub get` on the console.

<br/>

## **How to use**

Import

```dart
import 'package:android_autostart/android_autostart.dart';
```
<br/>

### **Check if Auto Start Setting is available.**

To check if devices supports navigation to Auto Start Setting screen use the `autoStartSettingIsAvailable` attribute. It returns `true` if the device is provided by a manufacture supported and `false` otherwise.

```dart
bool autoStartSettingIsAvailable = await AndroidAutostart.autoStartSettingIsAvailable;
```

<br/>

### **Navigate to Auto Start Setting screen.**

To navigate to Auto Start Setting screen use the `navigateAutoStartSetting` method. It returns `true` if the navigation is successful and `false` otherwise.

```dart
AndroidAutostart.navigateAutoStartSetting();
```

navigateAutoStartSetting supported Manufacturers:
  - Asus
  - Honor
  - Letv
  - Nokia
  - OnePlus
  - Oppo
  - Samsung
  - Vivo
  - Xiaomi

<br/>

### **Navigate to a specific screen.**

If a device provided by a unsupported manufacturer to need access the Auto Start Setting screen the `customSetComponent` method can be used. It navigates to a specific screen received in the method parameters. It returns `true` if the navigation is successful and `false` otherwise.

```dart
AndroidAutostart.customSetComponent(
  manufacturer: "xiaomi",
  pkg: "com.miui.securitycenter",
  cls: "com.miui.permcenter.autostart.AutoStartManagementActivity",
);
```

(Recommended use only if desired device manufacturer is not yet supported)

<br/>

## Platform Detail
Flutter 3.3.10 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 135454af32 (December 2022) • 2022-12-15 07:36:55 -0800
Engine • revision 3316dd8728
Tools • Dart 2.18.6 • DevTools 2.15.0

#

## Created by
[Shine Wanna](https://github.com/shinewanna)

## Maintained by
[Jeferson Mota](https://github.com/Jeferson505)
