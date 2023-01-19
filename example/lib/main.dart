import 'package:app_center_flutter/app_center_flutter.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await AppCenter.startAsync(
      appSecretAndroid: "ANDROIDKEY", appSecretIOS: "appSecretIOS");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  int click = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: Text("Number of click $click"),
            ),
            ElevatedButton(
                onPressed: () async {
                  await AppCenter.trackEventAsync(
                      "Event click", {"test": "click $click"});
                  setState(() {
                    click++;
                  });
                },
                child: Text("Acionar click")),
            Center(
              child: Text('App center SDK test'),
            ),
          ],
        ),
      ),
    );
  }
}
