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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Enable AutoStart Example App'),
        ),
        body: Center(
          child: Column(
            children: [
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
