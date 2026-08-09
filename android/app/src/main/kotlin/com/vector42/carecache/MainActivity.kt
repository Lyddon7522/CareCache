package com.vector42.carecache

import android.os.Handler
import android.os.Looper
import com.googlecode.tesseract.android.TessBaseAPI
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.util.TimeZone
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors

class MainActivity : FlutterActivity() {
    private val ocrExecutor: ExecutorService = Executors.newSingleThreadExecutor()
    private val mainHandler = Handler(Looper.getMainLooper())

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            PLATFORM_CHANNEL,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                GET_TIME_ZONE_IDENTIFIER_METHOD -> result.success(TimeZone.getDefault().id)
                else -> result.notImplemented()
            }
        }
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            LABEL_TEXT_CHANNEL,
        ).setMethodCallHandler { call, result ->
            if (call.method != RECOGNIZE_TEXT_METHOD) {
                result.notImplemented()
                return@setMethodCallHandler
            }

            val imagePath = call.argument<String>("imagePath")
            val tessDataPath = call.argument<String>("tessDataPath")
            if (imagePath.isNullOrBlank() || tessDataPath.isNullOrBlank()) {
                result.error("invalid_arguments", "Image and OCR data paths are required.", null)
                return@setMethodCallHandler
            }

            ocrExecutor.execute {
                val tesseract = TessBaseAPI()
                try {
                    check(tesseract.init(tessDataPath, "eng")) {
                        "The bundled English OCR model could not be initialized."
                    }
                    tesseract.pageSegMode = TessBaseAPI.PageSegMode.PSM_SPARSE_TEXT
                    tesseract.setImage(File(imagePath))
                    val recognizedText = tesseract.getUTF8Text().orEmpty()
                    mainHandler.post { result.success(recognizedText) }
                } catch (error: Throwable) {
                    mainHandler.post {
                        result.error("recognition_failed", error.message, null)
                    }
                } finally {
                    tesseract.recycle()
                }
            }
        }
    }

    override fun onDestroy() {
        ocrExecutor.shutdownNow()
        super.onDestroy()
    }

    private companion object {
        const val LABEL_TEXT_CHANNEL = "com.vector42.carecache/label_text"
        const val PLATFORM_CHANNEL = "com.vector42.carecache/platform"
        const val RECOGNIZE_TEXT_METHOD = "recognizeText"
        const val GET_TIME_ZONE_IDENTIFIER_METHOD = "getTimeZoneIdentifier"
    }
}
