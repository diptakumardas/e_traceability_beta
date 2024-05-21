import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  const Calender({super.key, required this.title, required this.hintText});
  final String title;
  final String hintText;
  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  TextEditingController _datecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 50,
          child: TextField(
            readOnly: true,
            onTap: () {
              _selecteDate();
            },
            controller: _datecontroller,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_month),
                hintText: widget.hintText,
                filled: true,
                fillColor: Colors.transparent,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        )
      ],
    );
  }

  Future<void> _selecteDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        initialDate: DateTime.now());
    if (picked != null) {
      setState(() {
        _datecontroller.text = picked.toString().split(" ")[0];
      });
    }
  }
}
