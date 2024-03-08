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
      backgroundColor: const Color(0xff4a4a7a),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      actions: [
        // CANCEL Button
        MaterialButton(
          onPressed: onCancel,
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),

        // SAVE Button
        MaterialButton(
          onPressed: onSave,
          child: const Text(
            "SAVE",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
