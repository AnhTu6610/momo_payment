package com.etech.momo_payment

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** MomoPaymentPlugin */
class MomoPaymentPlugin(private val registrar: Registrar): FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private var momoPaymentDelegate = MomoPaymentDelegate(registrar)
  private lateinit var channel : MethodChannel
  val momoPaymentPlugin = MomoPaymentPlugin(registrar)
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(registrar.messenger(), Constant.CHANNEL_NAME)
    channel.setMethodCallHandler(momoPaymentPlugin)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      Constant.METHOD_REQUEST_PAYMENT -> {
        momoPaymentDelegate.requestPayment(result, call.arguments)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
