import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_title.dart';
import 'preview_page.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({super.key});

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
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
              child: Consumer<McqProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions2.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        activeColor: Colors.black,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(farmingOptions2[index]),
                        value: provider.selectedOptionPage2 == index,
                        onChanged: (bool? newValue) {
                          provider.selectOptionPage2(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            CustomeButton(
              title: "পরবর্তী",
              onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreviewPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
