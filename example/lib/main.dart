import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vision_kit/flutter_vision_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _filePath;
  final _plugin = FlutterVisionKit();
  PlatformException _exception;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
              onPressed: () async {
                try {
                  final file = await _plugin.pickDocument();
                  setState(() {
                    _filePath = file;
                  });
                } on PlatformException catch (e) {
                  setState(() {
                    _exception = e;
                  });
                }
              },
              child: Text('Scan'),
            ),
            if (_exception != null) ...[
              Text('Exception'),
              Text(_exception.code),
              Text(_exception.message)
            ],
            if (_filePath != null) Text(_filePath)
          ],
        ),
      ),
    );
  }
}
