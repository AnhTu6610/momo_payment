import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:momo_payment/constant.dart';
import 'package:momo_payment/momo_payment_data.dart';
import 'package:momo_payment/momo_payment_result.dart';

class MomoPayment {
  static const MethodChannel _channel = const MethodChannel(Constant.channelName);

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<MomoPaymentResult> requestPayment(MomoPaymentData momoPaymentData) async {
    if (!kReleaseMode) print(json.encode(momoPaymentData));
    try {
      Map<String, dynamic> result = await _channel.invokeMapMethod(Constant.methodRequestPayment, momoPaymentData.toJson());
      return MomoPaymentResult.fromMap(result);
    } on PlatformException catch (error) {
      if (!kReleaseMode) print(error);
      return MomoPaymentResult(
        isSuccess: false,
      );
    }
  }
}
