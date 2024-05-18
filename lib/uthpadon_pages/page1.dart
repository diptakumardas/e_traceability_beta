import 'package:e_traceability_beta/uthpadon_pages/page2.dart';
import 'package:e_traceability_beta/widget/custome_appbar_uthpadon.dart';
import 'package:e_traceability_beta/widget/custome_button.dart';
import 'package:e_traceability_beta/widget/custome_titile_with_textfield.dart';
import 'package:e_traceability_beta/widget/custome_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UthpadonPage1 extends StatefulWidget {
  UthpadonPage1({super.key});

  @override
  State<UthpadonPage1> createState() => _UthpadonPage1State();
}

class _UthpadonPage1State extends State<UthpadonPage1> {
  final List<Map<String, dynamic>> farmingOptions = [
    {"title": "চিংড়ি এবং সাদা মাছ", "checked": false},
    {"title": "গলদা চিংড়ি + বাগদা চিংড়ি + সাদা মাছ", "checked": false},
    {"title": "চিংড়ি + সাদা মাছ + ধান", "checked": false},
    {"title": "অন্যান্য", "checked": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(title: "মাছের খামার এবং কৃষি ব্যবস্থা"),
            SizedBox(
              height: 50,
            ),
            Text("চাষের ধরন/বিভাগঃ "),
            SizedBox(
              height: 10,
            ),
            Container(
                height: MediaQuery.of(context).size.height * .24,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                          activeColor: Colors.black,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(farmingOptions[index]['title']),
                          value: farmingOptions[index]["checked"],
                          onChanged: (bool? newValue) {
                            setState(() {
                              farmingOptions[index]["checked"] = newValue!;
                            });
                          });
                    })),
            SizedBox(
              height: 20,
            ),
            const TitleWithField(
                title1: "চাষযোগ্য মোট জমির পরিমান", title2: "শতাংশ"),
            SizedBox(
              height: 50,
            ),
            CustomeButton(
                title: "পরবর্তী",
                onClicked: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UthpadonPage2()));
                })
          ],
        ),
      ),
    );
  }
}
