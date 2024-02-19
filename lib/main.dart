import 'package:flutter/material.dart';
import 'package:habbittracker_flutter/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // initializing hive box
  await Hive.initFlutter();

  // openig a box
  await Hive.openBox("Habit_Database");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
