import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWithField extends StatefulWidget {
  const TitleWithField({super.key,required this.title1, required this.title2});
  final  String title1;
  final String title2;

  @override
  State<TitleWithField> createState() => _TitleWithFieldState();
}

class _TitleWithFieldState extends State<TitleWithField> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title1),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                isDense: true,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(widget.title2)
        ],
      ),
    );
  }
}
