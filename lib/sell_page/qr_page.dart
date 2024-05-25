import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatelessWidget {
  final Uint8List? imageData;
  final Map<String, String> formValues;

  QrPage({Key? key, required this.imageData, required this.formValues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convert formValues to a single string
    String qrData = formValues.entries.map((e) => '${e.key}: ${e.value}').join('\n');

    return Scaffold(
      appBar: AppBar(
        title: Text('Generated QR Code'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 200.0,
              ),
              SizedBox(height: 20),
              //imageData != null ? Image.memory(imageData!) : Container(),
              SizedBox(height: 20),
              Text(
                'Scan the QR code to get the details',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                qrData,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
