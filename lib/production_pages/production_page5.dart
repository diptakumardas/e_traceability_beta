import 'package:e_traceability_beta/production_pages/production_page_6.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class UthpadonPage5 extends StatefulWidget {
  const UthpadonPage5({super.key});

  @override
  State<UthpadonPage5> createState() => _UthpadonPage5State();
}

class _UthpadonPage5State extends State<UthpadonPage5> {


  final List<Map<String, dynamic>> farmingOptions5 = [
    {"title": "হ্যাচারি এসপিএফ", "checked": false},
    {"title": "হ্যাচারি নন এসপিএফ", "checked": false},
    {"title": "প্রাকৃতিক", "checked": false},
    {"title": "বপ্রাকৃতিক এবং হ্যাচারি উভয়ই", "checked": false}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomTitle(title: "PL/ Juvenile এর উৎস"),


            SizedBox(
                height: MediaQuery.of(context).size.height*.25,
                width: MediaQuery.of(context).size.width,

                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions5.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                          activeColor: Colors.black,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(farmingOptions5[index]['title']),
                          value: farmingOptions5[index]["checked"],
                          onChanged: (bool? newValue) {
                            setState(() {
                              farmingOptions5[index]["checked"] = newValue!;
                            });
                          });
                    })),


            TitleWithField(title1: "বলদা রেণু মজুদ", title2: "প্রতি বিঘা"),
            TitleWithField(title1: "গলদা রেণু মজুদ", title2: "প্রতি বিঘা"),
            TitleWithField(title1: "বলদা পিছ", title2: "প্রতি বিঘা"),
            TitleWithField(title1: "সাদা মাছ", title2: "প্রতি বিঘা"),
            SizedBox(
              height: 20,
            ),
            Text("***বিশেষ দ্রষ্টব্যঃ  ১ বিঘা = ৩৩ শতাংশ",style: TextStyle(color: Colors.red),),
            SizedBox(
              height: 20,
            ),
            CustomeButton(title: "পরবর্তী", onClicked: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductionPage6()));
            })



          ],


          ),
        ));
  }
}
