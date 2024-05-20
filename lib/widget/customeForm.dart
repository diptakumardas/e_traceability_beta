import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customeform extends StatefulWidget {
  const Customeform({super.key,required this.title,required this.hintText, this.fieldIcon});
  final String title;
  final String hintText;
  final IconData? fieldIcon;

  @override
  State<Customeform> createState() => _CustomeformState();
}

class _CustomeformState extends State<Customeform> {
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

              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: widget.fieldIcon != null ? Icon(widget.fieldIcon) : null,
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
