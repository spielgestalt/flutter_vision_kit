import 'dart:io';

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
  List<String> _filePaths;
  final _plugin = FlutterVisionKit();
  bool _processing = false;
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
            if (_processing == false)
              FlatButton(
                onPressed: () async {
                  setState(() => _processing = true);
                  try {
                    final files = await _plugin.pickDocument();
                    setState(() {
                      _filePaths = files;
                    });
                  } on PlatformException catch (e) {
                    setState(() {
                      _exception = e;
                    });
                  }
                  setState(() => _processing = false);
                },
                child: Text('Scan'),
              )
            else
              Center(child: CircularProgressIndicator()),
            if (_exception != null) ...[
              Text('Exception'),
              Text(_exception.code),
              Text(_exception.message)
            ],
            if (_filePaths != null)
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filePaths.length,
                      itemBuilder: (context, index) => Image.file(
                          File(_filePaths[index].replaceFirst('file://', '')))))
          ],
        ),
      ),
    );
  }
}
