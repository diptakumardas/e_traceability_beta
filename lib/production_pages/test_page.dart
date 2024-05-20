import 'package:e_traceability_beta/production_pages/test_page_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';


class TestPage1 extends StatefulWidget {
  TestPage1({super.key, required this.onPressed});
  final void Function(List<String>) onPressed;

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  final List<String> farmingOptions = [
    "চিংড়ি এবং সাদা মাছ",
    "গলদা চিংড়ি + বাগদা চিংড়ি + সাদা মাছ",
    "চিংড়ি + সাদা মাছ + ধান",
    "অন্যান্য",
  ];
  final TextEditingController _otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: const CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitle(title: "মাছের খামার এবং কৃষি ব্যবস্থা"),
            const SizedBox(height: 50),
            const Text("চাষের ধরন/বিভাগঃ "),
            const SizedBox(height: 10),
            Container(
              height: size.height * .25,
              width: size.width,
              child: Consumer<McqProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions.length,
                    itemBuilder: (context, index) {
                      if (farmingOptions[index] == "অন্যান্য") {
                        return CheckboxListTile(
                          activeColor: Colors.black,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Row(
                            children: [
                              const Text("অন্যান্য"),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: _otherController,
                                  decoration: const InputDecoration(),
                                  onTap: () {
                                    provider.toggleOptionPage1(index);
                                  },
                                ),
                              ),
                            ],
                          ),
                          value: provider.selectedOptionsPage1.contains(index),
                          onChanged: (bool? newValue) {
                            provider.toggleOptionPage1(index);
                          },
                        );
                      } else {
                        return CheckboxListTile(
                          activeColor: Colors.black,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(farmingOptions[index]),
                          value: provider.selectedOptionsPage1.contains(index),
                          onChanged: (bool? newValue) {
                            provider.toggleOptionPage1(index);
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const TitleWithField(
                title1: "চাষযোগ্য মোট জমির পরিমান", title2: "শতাংশ"),
            const SizedBox(height: 50),
            CustomeButton(
              title: "পরবর্তী",
              onClicked: () {
                var provider = context.read<McqProvider>();
                List<String> selectedOptions = provider.selectedOptionsPage1.map((index) => farmingOptions[index]).toList();
                if (provider.selectedOptionsPage1.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("please choose an option"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                if (provider.selectedOptionsPage1.contains(farmingOptions.length - 1) && _otherController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("please enter a value for অন্যান্য"),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                widget.onPressed(selectedOptions);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TestPage2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}