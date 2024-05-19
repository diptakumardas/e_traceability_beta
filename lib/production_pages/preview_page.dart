import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final List<String> selectedOptions;

  const PreviewPage({Key? key, required this.selectedOptions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
      ),
      body: ListView.builder(
        itemCount: selectedOptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedOptions[index]),
          );
        },
      ),
    );
  }
}
