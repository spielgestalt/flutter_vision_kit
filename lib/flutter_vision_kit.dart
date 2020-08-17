import 'dart:async';

import 'package:flutter_vision_kit/src/flutter_vision_kit_plugin.dart';

class FlutterVisionKit {
  final _plugin = FlutterVisionKitPlugin.instance();
  Future<String> pickDocument({String simulatorImagePath}) {
    return _plugin.pickDocument(simulatorImagePath: simulatorImagePath);
  }
}
