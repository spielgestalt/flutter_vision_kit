import 'package:flutter/services.dart';

class FlutterVisionKitPlugin {
  final _channel = const MethodChannel('flutter_vision_kit');
  FlutterVisionKitPlugin._();
  factory FlutterVisionKitPlugin.instance() {
    return FlutterVisionKitPlugin._();
  }
  Future<String> pickDocument({String simulatorImagePath}) async {
    final String version =
        await _channel.invokeMethod('pickDocument', simulatorImagePath);
    return version;
  }
}
