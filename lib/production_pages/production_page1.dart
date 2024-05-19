import 'dart:ffi';

import 'package:e_traceability_beta/production_pages/production_page2.dart';
import 'package:e_traceability_beta/widget/custome_appbar_uthpadon.dart';
import 'package:e_traceability_beta/widget/custome_button.dart';
import 'package:e_traceability_beta/widget/custome_titile_with_textfield.dart';
import 'package:e_traceability_beta/widget/custome_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UthpadonPage1 extends StatefulWidget {
  UthpadonPage1({super.key, required this.onPressed});
  final void Function(String) onPressed;

  @override
  State<UthpadonPage1> createState() => _UthpadonPage1State();
}

class _UthpadonPage1State extends State<UthpadonPage1> {
  final List<String> farmingOptions = [
    "চিংড়ি এবং সাদা মাছ",
    "গলদা চিংড়ি + বাগদা চিংড়ি + সাদা মাছ",
    "চিংড়ি + সাদা মাছ + ধান",
    "অন্যান্য",
  ];
  int? _selectedIndex = null;
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
                                  decoration: const InputDecoration(

                                  ),
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          value: _selectedIndex == index,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        );
                      }else {
                        return CheckboxListTile(
                            activeColor: Colors.black,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(farmingOptions[index]),
                            value: _selectedIndex == index,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            });
                      }

                      /*return CheckboxListTile(
                          activeColor: Colors.black,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(farmingOptions[index]),
                          value: _selectedIndex == index,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          });*/
                    })),
            const SizedBox(
              height: 20,
            ),
            const TitleWithField(
                title1: "চাষযোগ্য মোট জমির পরিমান", title2: "শতাংশ"),
            const SizedBox(
              height: 50,
            ),
            CustomeButton(
                title: "পরবর্তী",
                onClicked: () {
                  if (_selectedIndex == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("please choose an option"),
                      backgroundColor: Colors.red,
                    ));

                    return;
                  }
                  String selectedOption = farmingOptions[_selectedIndex!];
                  if (_selectedIndex == farmingOptions.length - 1) {
                    selectedOption = _otherController.text;
                    if (selectedOption.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("please enter a value for অন্যান্য"),
                        backgroundColor: Colors.red,
                      ));
                      return;
                    }
                  }
                  widget.onPressed(farmingOptions[_selectedIndex!]);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UthpadonPage2()));
                })
          ],
        ),
      ),
    );
  }
}
