import 'package:flutter/material.dart';
import 'package:momo_payment/momo_payment.dart';
import 'package:momo_payment/momo_payment_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MomoPayment _momoPayment = new MomoPayment();
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
        body: Center(
          child: RaisedButton(
            onPressed: () {
              MomoPaymentData data = MomoPaymentData(
                merchantname: "E-Tech",
                merchantcode: "0777777777",
                partnerCode: "08888888",
                appScheme: "0999999999",
                amount: 200000,
                orderId: "order01",
                orderLabel: "Book ABC",
                isDevelopmentMode: true,
              );
              _momoPayment.requestPayment(data);
            },
            child: Text("Test MOMO"),
          ),
        ),
      ),
    );
  }
}
