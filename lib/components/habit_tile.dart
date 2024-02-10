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
      padding: const EdgeInsets.all(14.0),
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
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              // habit name
              Text(habitName),
              const Spacer(),
              // checkbox
              Checkbox(value: habitCompleted, onChanged: onChanged),
            ],
          ),
        ),
      ),
    );
  }
}
