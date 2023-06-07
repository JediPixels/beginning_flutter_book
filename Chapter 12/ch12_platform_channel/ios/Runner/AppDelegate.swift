import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {
        
        // Platform Channel
        let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController
        let deviceInfoChannel = FlutterMethodChannel(name: "platformchannel.companyname.com/deviceinfo", binaryMessenger: flutterViewController)
        deviceInfoChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            if (call.method == "getDeviceInfo") {
                self.getDeviceInfo(result: result)
            }
            else {
                result(FlutterMethodNotImplemented)
            }
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func getDeviceInfo(result: FlutterResult) {
        let device = UIDevice.current
        var deviceInfo: String = "";
        deviceInfo = "\nName: \(device.name)"
        deviceInfo += "\nModel: \(device.model)"
        deviceInfo += "\nSystem: \(device.systemName)  \(device.systemVersion)"
        deviceInfo += "\nProximity Monitoring Enabled: \(device.isProximityMonitoringEnabled)"
        deviceInfo += "\nMultitasking Supported: \(device.isMultitaskingSupported)"
        result(deviceInfo)
    }
}
