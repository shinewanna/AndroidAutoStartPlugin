import 'package:flutter/material.dart';
import 'package:android_autostart/android_autostart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void _checkIfAutoStartSettingIsAvailable() async {
    AndroidAutostart.autoStartSettingIsAvailable.then((isAvailable) {
      _scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Auto start setting is available: $isAvailable"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldMessengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Enable AutoStart Example App'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _checkIfAutoStartSettingIsAvailable,
                child: const Text('Check if AutoStart is available'),
              ),
              ElevatedButton(
                onPressed: () async =>
                    await AndroidAutostart.navigateAutoStartSetting,
                child: const Text("Navigate AutoStart Setting"),
              ),
              ElevatedButton(
                onPressed: () async =>
                    await AndroidAutostart.customSetComponent(
                  manufacturer: "xiaomi",
                  pkg: "com.miui.securitycenter",
                  cls:
                      "com.miui.permcenter.autostart.AutoStartManagementActivity",
                ),
                child: const Text("Custom Set Component"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
