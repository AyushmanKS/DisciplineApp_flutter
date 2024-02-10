import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String hintText;
  const MyAlertBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hintText),
        ),
      ),
      actions: [
        // CANCEL Button
        MaterialButton(
          onPressed: onCancel,
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.red),
          ),
        ),

        // SAVE Button
        MaterialButton(
          onPressed: onSave,
          child: const Text(
            "SAVE",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
