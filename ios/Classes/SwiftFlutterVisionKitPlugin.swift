import Flutter
import UIKit

public class SwiftFlutterVisionKitPlugin: NSObject, FlutterPlugin {
    var visionController:VisionKitController?
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_vision_kit", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterVisionKitPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method != "pickDocument"){
        result(FlutterError(code: "not_implemented", message: "\(call.method) is not implemented", details: nil))
        return
    }
    #if targetEnvironment(simulator)
    result(FlutterError(code: "not_implemented", message: "Can not run on Simulator", details: nil))
    return
    #else
    visionController.pickDocument{ pickerResult in
        if (visionController == nil){
            visionController = VisionKitController
        }
        
        switch(pickerResult){
        case .success(let pickerResult):
            switch pickerResult {

            
            }
            result(path)
        case .failure(let error):
            result(FlutterError(code: "code", message: error.localizedDescription, details: nil))
        }
    }
    #endif
  }
}
