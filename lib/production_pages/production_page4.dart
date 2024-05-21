
import 'package:e_traceability_beta/production_pages/production_page5.dart';
import 'package:e_traceability_beta/widget/custome_button.dart';
import 'package:e_traceability_beta/widget/custome_titile_with_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_title.dart';

class UthpadonPage4 extends StatefulWidget {
  const UthpadonPage4({super.key});

  @override
  State<UthpadonPage4> createState() => _UthpadonPage4State();
}

class _UthpadonPage4State extends State<UthpadonPage4> {
  final List<Map<String, dynamic>> farmingOptions4 = [
    {"title": "খামার তৈরি বা মিক্সড খাদ্য", "checked": false},
    {"title": "স্থানীয় ফিড মিল", "checked": false},
    {"title": "কোম্পানী কর্তৃক বাজারজাতকৃত খাদ্য", "checked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomTitle(title: "ব্যবহৃত ফিডের ধরন"),


                SizedBox(
                    height: MediaQuery.of(context).size.height*.25,
                    width: MediaQuery.of(context).size.width,

                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: farmingOptions4.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                              activeColor: Colors.black,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(farmingOptions4[index]['title']),
                              value: farmingOptions4[index]["checked"],
                              onChanged: (bool? newValue) {
                                setState(() {
                                  farmingOptions4[index]["checked"] = newValue!;
                                });
                              });
                        })),
                
                
                TitleWithField(title1: "আপনি দিনে কতবার খাবার খাওয়ান", title2: "বার", textFieldValue: '',),
                SizedBox(
                  height: 20,
                ),
                CustomeButton(title: "পরবর্তী", onClicked: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UthpadonPage5()));
                })
                
                
                
          ],


              ),
        ));
  }
}
