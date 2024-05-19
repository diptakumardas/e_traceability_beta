
import 'package:e_traceability_beta/production_pages/production_page3.dart';
import 'package:e_traceability_beta/widget/custome_appbar_uthpadon.dart';
import 'package:e_traceability_beta/widget/custome_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/custome_title.dart';

class UthpadonPage2 extends StatefulWidget {
  const UthpadonPage2({super.key});

  @override
  State<UthpadonPage2> createState() => _UthpadonPage2State();
}

class _UthpadonPage2State extends State<UthpadonPage2> {

  final List<Map<String, dynamic>> farmingOptions2 = [
    {"title": "ফসল উৎপাদনের পরে পুকুরের তলা শুকানো হয়েছে?", "checked": false},
    {"title": "কালো মাটি সরানো হয়েছে?", "checked": false},
    {"title": "পাথুরে চুন বা লাইমিং করা হয়েছে কিনা ?", "checked": false},
    {"title": "ব্লিচিং ব্যবহার করা হয়েছে?", "checked": false},
    {"title": "পানি দেয়ার পূর্বে সম্পূর্ণ পুকুর পরিষ্কার করা হয়েছে?", "checked": false},
    {"title": "ব্অবাঞ্ছিত গাছপালা পরিষ্কার করা হয়েছে কিনা?", "checked": false},
    {"title": "বরাক্ষুসে ও অবাঞ্ছিত মাছ সরানো হয়েছে?", "checked": false},
    {"title": "পাড় মেরামত ও উঁচু করে বাঁধা হয়েছে কিনা", "checked": false},
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
            CustomTitle(title: "পুকুর প্রস্তুতি"),
            SizedBox(
              height: 50,
            ),
            Container(
                height: MediaQuery.of(context).size.height*.5,
                width: MediaQuery.of(context).size.width,

                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions2.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                          activeColor: Colors.black,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(farmingOptions2[index]['title']),
                          value: farmingOptions2[index]["checked"],
                          onChanged: (bool? newValue) {
                            setState(() {
                              farmingOptions2[index]["checked"] = newValue!;
                            });
                          });
                    })),
            SizedBox(
              height: 20,
            ),
            CustomeButton(title: "পরবর্তী", onClicked: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UthpadonPage3()));
            })


          ],
        ),
      ),
    );
  }
}
