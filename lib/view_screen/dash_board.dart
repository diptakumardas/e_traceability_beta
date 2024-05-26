import 'dart:io';
import 'dart:typed_data';
import 'package:e_traceability_beta/production_pages/pp1.dart';
import 'package:e_traceability_beta/sell_page/sell_screen.dart';
import 'package:e_traceability_beta/view_screen/notification_page.dart';
import 'package:e_traceability_beta/view_screen/test_login_screen.dart';
import 'package:e_traceability_beta/widget/custome_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../production_pages/production_page1.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  Uint8List? _image;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0,left: 16,right: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .22,
                          width: MediaQuery.of(context).size.width * .45,
                          child: Image.asset(
                            "images/user.png",
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 50,
                          right: 80,
                          left: 140,
                          top: 155,
                          child: IconButton(onPressed: (){
                            showImagePickerOption(context);
                          },icon: Icon(Icons.add_a_photo,size: 30,),))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  const Text(
                    " খামারির আইডিঃ ১৬৭০০১",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height * .06,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .34,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomeContainer(
                                  title: "উৎপাদন",
                                  onClicked: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductionPage1()));
                                  },
                                  imagePath: "images/Vector.svg"),
                              CustomeContainer(
                                  title: "বিক্রি",
                                  onClicked: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SellScreen()));
                                  },
                                  imagePath: "images/Vector.svg"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomeContainer(
                                  title: "রিপোর্ট",
                                  onClicked: () {},
                                  imagePath: "images/show chart.svg"),
                              CustomeContainer(
                                  title: "নোটিফিকেশন ",
                                  onClicked: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
                                  },
                                  imagePath: "images/notification.svg"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 48,),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreenTest()));
                    },
                    child: Container(
                      height: MediaQuery.sizeOf(context).height*.07,
                      width: MediaQuery.sizeOf(context).width*.87,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(child: Text("লগআউট করুন",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );


  }


  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height / 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 60,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 60,
                            ),
                            Text("gallery")
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }













  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.pop(context);
  }


  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.pop(context);
  }



}
