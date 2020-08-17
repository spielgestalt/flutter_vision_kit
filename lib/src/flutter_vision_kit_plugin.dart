import 'package:flutter/services.dart';

class FlutterVisionKitPlugin {
  final _channel = const MethodChannel('flutter_vision_kit');
  FlutterVisionKitPlugin._();
  factory FlutterVisionKitPlugin.instance() {
    return FlutterVisionKitPlugin._();
  }
  Future<List<String>> pickDocument({String simulatorImagePath}) async {
    final List<dynamic> images =
        await _channel.invokeMethod('pickDocument', simulatorImagePath);
    return images.map((e) => e.toString()).toList();
  }
}
