import 'package:e_traceability_beta/production_pages/preview_page.dart';
import 'package:e_traceability_beta/production_pages/production_page3.dart';
import 'package:e_traceability_beta/production_pages/test_page_2.dart';
import 'package:e_traceability_beta/widget/custome_appbar_uthpadon.dart';
import 'package:e_traceability_beta/widget/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/screen_provider.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class TestPage1 extends StatelessWidget {
  final List<String> farmingOptions2 = [
    "ফসল উৎপাদনের পরে পুকুরের তলা শুকানো হয়েছে?",
    "কালো মাটি সরানো হয়েছে?",
    "পাথুরে চুন বা লাইমিং করা হয়েছে কিনা ?",
    "ব্লিচিং ব্যবহার করা হয়েছে?",
    "পানি দেয়ার পূর্বে সম্পূর্ণ পুকুর পরিষ্কার করা হয়েছে?",
    "ব্অবাঞ্ছিত গাছপালা পরিষ্কার করা হয়েছে কিনা?",
    "বরাক্ষুসে ও অবাঞ্ছিত মাছ সরানো হয়েছে?",
    "পাড় মেরামত ও উঁচু করে বাঁধা হয়েছে কিনা",
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
            SizedBox(height: 50),
            Container(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              child: Consumer<FarmingOptionsProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions2.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        activeColor: Colors.black,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(farmingOptions2[index]),
                        value: provider.selectedOptions[index],
                        onChanged: (bool? newValue) {
                          provider.toggleOption(index);
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
                title1: "চাষযোগ্য মোট জমির পরিমান",
                title2: "শতাংশ",
                textFieldValue:
                    Provider.of<FarmingOptionsProvider>(context).landArea),
            SizedBox(height: 20),
            CustomeButton(
              title: "পরবর্তী",
              onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestPage2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
