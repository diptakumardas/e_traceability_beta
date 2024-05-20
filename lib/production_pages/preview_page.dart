import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/screen_provider.dart';
class PreviewPage extends StatelessWidget {
  final List<String> optionsPage1 = [
    "চিংড়ি এবং সাদা মাছ",
    "গলদা চিংড়ি + বাগদা চিংড়ি + সাদা মাছ",
    "চিংড়ি + সাদা মাছ + ধান",
    "অন্যান্য",
  ];

  final List<String> optionsPage2 = [
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
      appBar: AppBar(title: Text('Preview Page')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<McqProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selections from Page 1:'),
                Text(provider.selectedOptionsPage1 != null
                    ? optionsPage1[provider.selectedOptionPage2!]
                    : 'No selection'),
                SizedBox(height: 20),
                Text('Selections from Page 2:'),
                Text(provider.selectedOptionPage2 != null
                    ? optionsPage2[provider.selectedOptionPage2!]
                    : 'No selection'),
              ],
            );
          },
        ),
      ),
    );
  }
}
