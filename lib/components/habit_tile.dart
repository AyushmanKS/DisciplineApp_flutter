import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.habitCompleted,
      required this.onChanged,
      required this.settingsTapped,
      required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      // Slidable implemented
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          // settings option
          SlidableAction(
            onPressed: settingsTapped,
            backgroundColor: const Color.fromARGB(255, 216, 149, 149),
            icon: Icons.edit,
            borderRadius: BorderRadius.circular(12),
          ),
          // delete option
          SlidableAction(
            onPressed: deleteTapped,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          decoration: BoxDecoration(
              color: const Color(0xffef927f),
              borderRadius: BorderRadius.circular(18)),
          child: Row(
            children: [
              // habit name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  habitName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const Spacer(),
              // checkbox
              Checkbox(
                value: habitCompleted,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
