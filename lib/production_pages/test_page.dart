import 'package:e_traceability_beta/production_pages/preview_page.dart';
import 'package:e_traceability_beta/production_pages/test_page_2.dart';
import 'package:e_traceability_beta/widget/custome_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final List<String> farmingOptions = [
    "চিংড়ি এবং সাদা মাছ",
    "গলদা চিংড়ি + বাগদা চিংড়ি + সাদা মাছ",
    "চিংড়ি + সাদা মাছ + ধান",
    "অন্যান্য",
  ];
  Set<int> _selectedIndices = {};






  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitle(title: "মাছের খামার এবং কৃষি ব্যবস্থা"),
            const SizedBox(
              height: 50,
            ),
            const Text("চাষের ধরন/বিভাগঃ "),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: size.height * .25,
              width: size.width,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: farmingOptions.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    activeColor: Colors.black,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(farmingOptions[index]),
                    value: _selectedIndices.contains(index),
                    onChanged: (bool? newValue) {
                      setState(() {
                        if (newValue == true) {
                          _selectedIndices.add(index);
                        } else {
                          _selectedIndices.remove(index);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TitleWithField(
              title1: "চাষযোগ্য মোট জমির পরিমান",
              title2: "শতাংশ",
            ),
            ElevatedButton(
              onPressed: () {
                List<String> selectedOptions = _selectedIndices
                    .map((index) => farmingOptions[index])
                    .toList();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestPage2(selectedOptions: selectedOptions),
                  ),
                );
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
