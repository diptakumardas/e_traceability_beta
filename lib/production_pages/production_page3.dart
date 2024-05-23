
import 'package:e_traceability_beta/production_pages/production_page4.dart';
import 'package:e_traceability_beta/widget/custome_appbar_uthpadon.dart';
import 'package:e_traceability_beta/widget/custome_button.dart';
import 'package:e_traceability_beta/widget/custome_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UthpadonPage3 extends StatefulWidget {
  const UthpadonPage3({super.key});

  @override
  State<UthpadonPage3> createState() => _UthpadonPage3State();
}

class _UthpadonPage3State extends State<UthpadonPage3> {

  final List<Map<String, dynamic>> farmingOptions3 = [
    {"title": "সংলগ্ন খাল", "checked": false},
    {"title": "নদী", "checked": false},
    {"title": "ভূগর্ভস্থ পানি", "checked": false},
    {"title": "বৃষ্টির পানি", "checked": false}
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitle(title: "পানির উৎস"),
            SizedBox(
                height: MediaQuery.of(context).size.height*.3,
                width: MediaQuery.of(context).size.width,

                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions3.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                          activeColor: Colors.black,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(farmingOptions3[index]['title']),
                          value: farmingOptions3[index]["checked"],
                          onChanged: (bool? newValue) {
                            setState(() {
                              farmingOptions3[index]["checked"] = newValue!;
                            });
                          });
                    })),
            SizedBox(
              height: 10,
            ),
            const Text("লবণাক্ততা:"),
            const SizedBox(
              height: 10,
            ),
             Row(children: [
               const Text("পানিতে লবণাক্ততার পরিমান?"),
              Expanded(

                  child: const TextField(
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                      isDense: true,
                    ),
                  )),
            ],),
            const SizedBox(
              height: 40,
            ),

            CustomeButton(title: "পরবর্তী", onClicked: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UthpadonPage4()));
            })


          ],
        ),
      ),
    );
  }
}
