import 'package:flutter/material.dart';

class MyFloatingActonButton extends StatelessWidget {
  final Function()? onPressed;

  const MyFloatingActonButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}
