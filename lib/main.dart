import 'package:e_traceability_beta/splash_screen/splash_screen.dart';
import 'package:e_traceability_beta/uthpadon_pages/page1.dart';
import 'package:e_traceability_beta/view_screen/dash_board.dart';
import 'package:e_traceability_beta/widget/custome_container.dart';
import 'package:e_traceability_beta/widget/custome_title.dart';
import 'package:flutter/material.dart';

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
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}





