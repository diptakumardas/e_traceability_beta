import 'package:e_traceability_beta/widget/custom_checkbox_for_yes_no.dart';
import 'package:e_traceability_beta/widget/custome_appbar_uthpadon.dart';
import 'package:e_traceability_beta/widget/custome_button.dart';
import 'package:e_traceability_beta/widget/custome_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductionPage6 extends StatefulWidget {
  const ProductionPage6({super.key});

  @override
  State<ProductionPage6> createState() => _ProductionPage6State();
}

class _ProductionPage6State extends State<ProductionPage6> {

  final List<String> option = [
    'হ্যাঁ',
    "না"
  ];

  final List<String> farmingOptions6 = [
    "পিএইচ",
    "লবণাক্ততা",
    "অক্সিজেন",
    "নাইট্রাইট",
    "নাইট্রেট",
    "অ্যামোনিয়া",
    "অন্যান্য",
  ];

  int? _selectedIndex = null;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(title: "মাছের স্বাস্থ্য এবং পানির গুণাগুণ পরীক্ষা"),
            SizedBox(
              height: size.height*.04,
            ),
            Text("আপনি কি মাছ/চিংড়ি বৃদ্ধির হার পরীক্ষা করেন?"),
            YesNoCheckBox(),
            SizedBox(
              height: size.height*.04,
            ),
            Text(
              "আপনি পানির গুনাগুনের নিচের কোন টেস্টগুলো করেন এবং রেকর্ড রাখেন?",
              style: TextStyle(fontSize: 16),
            ),

            Container(
                height: size.height * .5,
                width: size.width,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions6.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                          activeColor: Colors.black,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(farmingOptions6[index]),
                          value: _selectedIndex == index,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          });
                    })),
            SizedBox(
              height: size.height*.08,
            ),
            CustomeButton(title: "সব দেখুন", onClicked: () {})
          ],
        ),
      ),
    );
  }
}
