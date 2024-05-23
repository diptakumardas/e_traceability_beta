/*
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

TextEditingController controller1 =TextEditingController();
TextEditingController controller2 =TextEditingController();
TextEditingController controller3 =TextEditingController();
TextEditingController controller4 =TextEditingController();
TextEditingController controller5 =TextEditingController();

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
               Customeform(
                  title: "খামারির নাম", hintText: "নাম লিখুন"),
              const SizedBox(
                height: 10,
              ),
              const Customeform(title: "ঠিকানা", hintText: "ঠিকানা লিখুন"),
              const SizedBox(
                height: 10,
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
              CustomeButton(title: "QR তৈরি করুন", onClicked: (){

              })
            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'dart:io';
import 'dart:typed_data';


import 'package:e_traceability_beta/widget/calender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../widget/camra_module.dart';
import '../widget/customeForm.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import 'qr_page.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  Uint8List? _image;
  File? selectedImage;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeAppbarUth(title: "বিক্রয় করুন"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CamraModule(),
              const SizedBox(
                height: 30,
              ),
              Customeform(title: "খামারির নাম", hintText: "নাম লিখুন",controller: controller1),
              const SizedBox(
                height: 10,
              ),
              Customeform(title: "ঠিকানা", hintText: "ঠিকানা লিখুন",controller: controller2,),
              const SizedBox(
                height: 10,
              ),
              Customeform(title: "পরিমাণ", hintText: "পরিমাণ লিখুন",controller: controller3,),
              const SizedBox(
                height: 10,
              ),
              Customeform(title: "দাম", hintText: "দাম লিখুন",controller: controller4,),
              const SizedBox(
                height: 10,
              ),
              const Calender(title: "তারিখ", hintText: "তারিখ নির্বাচন করুন",),
              const SizedBox(
                height: 40,
              ),
              CustomeButton(
                title: "QR তৈরি করুন",
                onClicked: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QrPage(
                        // Pass data to QR page
                        imageData: _image,
                        formValues: {
                          "খামারির নাম": controller1.text,
                          "ঠিকানা": controller2.text,
                          "পরিমাণ": controller3.text,
                          "দাম": controller4.text,
                          "তারিখ": controller5.text,
                        },
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
