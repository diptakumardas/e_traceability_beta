import 'package:e_traceability_beta/production_pages/production_page_6.dart';
import 'package:e_traceability_beta/production_pages/test_page.dart';
import 'package:e_traceability_beta/provider/screen_provider.dart';
import 'package:e_traceability_beta/sell_page/sell_screen.dart';
import 'package:e_traceability_beta/splash_screen/splash_screen.dart';
import 'package:e_traceability_beta/view_screen/dash_board.dart';
import 'package:e_traceability_beta/widget/custome_container.dart';
import 'package:e_traceability_beta/widget/custome_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FarmingOptionsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SellScreen()
      ),
    );
  }
}
