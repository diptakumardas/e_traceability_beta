import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customeform extends StatefulWidget {
  const Customeform({super.key,required this.title,required this.hintText,});
  final String title;
  final String hintText;


  @override
  State<Customeform> createState() => _CustomeformState();
}

class _CustomeformState extends State<Customeform> {

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(widget.title),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: Form(
            child: TextFormField(
              controller: controller,

              obscureText: true,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 15,color: Colors.black),
                fillColor: Colors.white30,
                filled: true,

                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
