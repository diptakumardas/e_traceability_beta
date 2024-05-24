
import 'dart:ffi';

import 'package:flutter/material.dart';
class CustomeTextField extends StatefulWidget {
  const CustomeTextField({super.key,required this.title,required this.hintText, required this.onChanged, required this.obscureText, required this.errorMessage, this.suffixIcons});
  final String title, hintText, errorMessage;
  final Function onChanged;
  final bool obscureText;
  final IconData? suffixIcons ;


  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.title}",
            style: TextStyle(fontSize: 18,color: Colors.black87),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 48,
            child: TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return widget.errorMessage;
                }
                return null;
              },
              obscureText: widget.obscureText,
              onChanged: (text) {widget.onChanged.call(text);},
              decoration: InputDecoration(
                suffixIcon: Icon(widget.suffixIcons),
                  hintText: '${widget.hintText}',
                  hintStyle: const TextStyle(color: Colors.black87),
                  filled: true,
                  fillColor: Colors.white30,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(2),

                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(2),
                  )
              ),
            ),
          ),
        ]
    );
  }
}
