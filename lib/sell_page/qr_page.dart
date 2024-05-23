import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatelessWidget {
  const QrPage({Key? key, required this.imageData, required this.formValues})
      : super(key: key);

  final Uint8List? imageData;
  final Map<String, String> formValues;

  @override
  Widget build(BuildContext context) {
    String qrData = "Image: $imageData\n";
    formValues.forEach((key, value) {
      qrData += "$key: $value\n";
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code"),
      ),
      body: Column(
        children: [
          Center(
            child: QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 200,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("প্রিন্ট করুন"),
                Icon(Icons.print),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text("এড়িয়ে যান"),
          )
        ],
      ),
    );
  }
}
