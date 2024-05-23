import 'package:e_traceability_beta/production_pages/pp1.dart';
import 'package:e_traceability_beta/sell_page/sell_screen.dart';
import 'package:e_traceability_beta/view_screen/notification_page.dart';
import 'package:e_traceability_beta/widget/custome_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../production_pages/production_page1.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String uthpadonPage1 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .22,
                    width: MediaQuery.of(context).size.width * .45,
                    child: Image.asset(
                      "images/farmar.jpeg",
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .03,
                ),
                const Text(
                  " খামারির আইডিঃ ১৬৭০০১",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .34,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomeContainer(
                                title: "উৎপাদন",
                                onClicked: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductionPage1()));
                                },
                                imagePath: "images/Vector.svg"),
                            CustomeContainer(
                                title: "বিক্রি",
                                onClicked: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SellScreen()));
                                },
                                imagePath: "images/Vector.svg"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomeContainer(
                                title: "রিপোর্ট",
                                onClicked: () {},
                                imagePath: "images/show chart.svg"),
                            CustomeContainer(
                                title: "নোটিফিকেশন ",
                                onClicked: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
                                },
                                imagePath: "images/notification.svg"),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
