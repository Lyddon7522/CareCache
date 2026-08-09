import Flutter
import UIKit
import Vision

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private var labelTextChannel: FlutterMethodChannel?
  private var platformChannel: FlutterMethodChannel?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    guard let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CareCacheLabelText") else {
      return
    }
    let channel = FlutterMethodChannel(
      name: "com.vector42.carecache/label_text",
      binaryMessenger: registrar.messenger()
    )
    channel.setMethodCallHandler(recognizeLabelText)
    labelTextChannel = channel

    let deviceChannel = FlutterMethodChannel(
      name: "com.vector42.carecache/platform",
      binaryMessenger: registrar.messenger()
    )
    deviceChannel.setMethodCallHandler { call, result in
      guard call.method == "getTimeZoneIdentifier" else {
        result(FlutterMethodNotImplemented)
        return
      }
      result(TimeZone.current.identifier)
    }
    platformChannel = deviceChannel
  }

  private func recognizeLabelText(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard call.method == "recognizeText" else {
      result(FlutterMethodNotImplemented)
      return
    }
    guard
      let arguments = call.arguments as? [String: Any],
      let imagePath = arguments["imagePath"] as? String,
      !imagePath.isEmpty
    else {
      result(FlutterError(
        code: "invalid_arguments",
        message: "An image path is required.",
        details: nil
      ))
      return
    }

    DispatchQueue.global(qos: .userInitiated).async {
      let request = VNRecognizeTextRequest()
      request.recognitionLevel = .accurate
      request.usesLanguageCorrection = true
      request.recognitionLanguages = ["en-US"]

      do {
        let handler = VNImageRequestHandler(url: URL(fileURLWithPath: imagePath), options: [:])
        try handler.perform([request])
        let lines = (request.results ?? []).compactMap { observation in
          observation.topCandidates(1).first?.string
        }
        DispatchQueue.main.async { result(lines.joined(separator: "\n")) }
      } catch {
        DispatchQueue.main.async {
          result(FlutterError(
            code: "recognition_failed",
            message: error.localizedDescription,
            details: nil
          ))
        }
      }
    }
  }
}
