import 'package:flutter/material.dart';

class VulcanAlertDialog extends StatelessWidget {
  const VulcanAlertDialog({super.key, required this.textAlert});

  final String textAlert;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Attention :",
        style: TextStyle(color: Colors.black),
      ),
      content: Text(textAlert),
      actions: <Widget>[
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
