# Android AutoStart

This is an AutoStart library for flutter.
You can request to enable AutoStart with Android AutoStart.
Many Developers need to access AutoStart Setting in Flutter including me, but there's no good plugin yet for autostart.So I decided to make AutoStart Plugin for Developers.


## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).

## Installation and Usage

Add `android_autostart` to the dependencies list
of the `pubspec.yaml` file as follow:

```yaml
dependencies:
  flutter:
    sdk: flutter

  android_autostart: ^0.0.2
```

Then run the command `flutter packages get` on the console.

Import

```dart
import 'package:android_autostart/android_autostart.dart';
```

Navigate to AutoStart Setting.

navigateAutoStartSetting Supported Manufactures:
    - Xiaomi
    - Oppo
    - Vivo
    - Letv
    - Honor

```dart
     await AndroidAutostart.navigateAutoStartSetting;
```

You can use CustomSetComponent.

```dart
     await AndroidAutostart.customSetComponent(
                  manufacturer: "xiaomi",
                  pkg: "com.miui.securitycenter",
                  cls:
                      "com.miui.permcenter.autostart.AutoStartManagementActivity",
                 );
```

## Platform Detail
Flutter 2.8.1 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 77d935af4d (2 months ago) • 2021-12-16 08:37:33 -0800
Engine • revision 890a5fca2e
Tools • Dart 2.15.1

### Created by
[Shine Wanna](https://github.com/shinewanna)
