import 'package:flutter/material.dart';

class MyFloatingActonButton extends StatelessWidget {
  final Function()? onPressed;

  const MyFloatingActonButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 230, 206, 214),
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
