import 'dart:io';
import 'dart:typed_data';

import 'package:e_traceability_beta/widget/calender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/camra_module.dart';
import '../widget/customeForm.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {

  Uint8List? _image;
  File? selectedImage;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeAppbarUth(title: "বিক্রয় করুন"),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CamraModule(),
              const SizedBox(
                height: 30,
              ),
              const Customeform(title: "পরিমাণ", hintText: "পরিমাণ লিখুন"),
              const SizedBox(
                height: 10,
              ),
              const Customeform(title: "দাম", hintText: "দাম লিখুন"),
              const SizedBox(
                height: 10,
              ),
              Calender(title: "তারিখ", hintText: "তারিখ নির্বাচন করুন"),
              const SizedBox(
                height: 40,
              ),
              CustomeButton(title: "QR তৈরি করুন", onClicked: (){})
            ],
          ),
        ),
      ),
    );
  }
}
