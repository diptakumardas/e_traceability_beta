import 'package:e_traceability_beta/production_pages/pp6.dart';
import 'package:e_traceability_beta/production_pages/preview_page.dart';
import 'package:e_traceability_beta/production_pages/production_page_6.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class ProductionPage5 extends StatefulWidget {
  const ProductionPage5({super.key});

  @override
  State<ProductionPage5> createState() => _ProductionPage5State();
}

class _ProductionPage5State extends State<ProductionPage5> {


  final List<String> farmingOptions5 = [
   "হ্যাচারি এসপিএফ",
    "হ্যাচারি নন এসপিএফ",
   "প্রাকৃতিক",
    "প্রাকৃতিক এবং হ্যাচারি উভয়ই",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
    body: Padding(
    padding: EdgeInsets.all(10.0),
    child:
    SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomTitle(title: "PL/ Juvenile এর উৎস"),
        const SizedBox(
      height: 10,
      ),
      Container(
      height: MediaQuery.of(context).size.height * .25,
      width: MediaQuery.of(context).size.width,
      child: Consumer<FarmingOptionsProvider>(
      builder: (context, provider, child) {
      return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: farmingOptions5.length,
      itemBuilder: (context, index) {
      return CheckboxListTile(
      activeColor: Colors.black,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(farmingOptions5[index]),
      value: provider.selectedOptions5[index],
      onChanged: (bool? newValue) {
      provider.toggleOption5(index);
      },
      );
      },
      );
      },
      ),
      ),
        const SizedBox(
          height: 20,
        ),
        TitleWithField(
            title1: "বাগদা রেণু মজুদ",
            title2: "প্রতি বিঘা",
            textFieldValue:
            Provider.of<FarmingOptionsProvider>(context).bagdaAmount),
        TitleWithField(
            title1: "গলদা রেণু মজুদ",
            title2: "প্রতি বিঘা",
            textFieldValue:
            Provider.of<FarmingOptionsProvider>(context).galdaAmount),
        TitleWithField(
            title1: "বলদা পিছ",
            title2: "প্রতি বিঘা",
            textFieldValue:
            Provider.of<FarmingOptionsProvider>(context).bagdaPAmount),
        TitleWithField(
            title1: "সাদা মাছ",
            title2: "সাদা মাছ",
            textFieldValue:
            Provider.of<FarmingOptionsProvider>(context).galdaPAmount),
        SizedBox(
          height: 20,
        ),
        Text("***বিশেষ দ্রষ্টব্যঃ  ১ বিঘা = ৩৩ শতাংশ",style: TextStyle(color: Colors.red),),
        SizedBox(
          height: 20,
        ),
        CustomeButton(title: "পরবর্তী", onClicked: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalPage()));
        })
      ]
      ),
    )
    )
    );
  }
}
