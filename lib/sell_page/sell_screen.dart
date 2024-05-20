import 'dart:io';
import 'dart:typed_data';

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
              /*Container(
                height: 120,
                width: double.infinity,
                color: Color(0xFFE0FFD6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.image_outlined,color: Colors.grey,size: 40,),),
                    const Text("ছবি নির্বাচন করুন",style: TextStyle(color: Colors.grey,fontSize: 15),)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: const Color(0xFFE0FFD6),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.camera_alt,size: 18,color: Colors.green,),
                      Padding(
                        padding: EdgeInsets.only(right:  60.0),
                        child: Text("ক্যামেরা খুলুন এবং ছবি তুলুন",style: TextStyle(fontSize: 15,color: Colors.green),),
                      ),
                    ],
                  ),
                ),
              ),*/
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
              const Customeform(title: "তারিখ", hintText: "নির্বাচন কারুন",fieldIcon: Icons.calendar_month,),
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
