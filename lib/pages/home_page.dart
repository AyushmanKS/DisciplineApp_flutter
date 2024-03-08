import 'package:flutter/material.dart';
import 'package:habbittracker_flutter/components/habit_tile.dart';
import 'package:habbittracker_flutter/components/month_summart.dart';
import 'package:habbittracker_flutter/components/my_fab.dart';
import 'package:habbittracker_flutter/components/new_alert_box.dart';
import 'package:habbittracker_flutter/data/habit_database.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // instance for HabitDatabase Class
  HabitDatabase db = HabitDatabase();

  // reference for out Habit_Database
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    // first time opening app ?
    // if yes: create default data
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }
    // not first time opening
    else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();

    super.initState();
  }

  // checkbox is tapped
  void checkBoxTapped(bool value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

// create new habit
  final _newHabitNameController = TextEditingController();

  // give user option to create new habit
  void createNewHabit() {
    // alert dialog to input new habit
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newHabitNameController,
            onSave: saveNewHabit,
            onCancel: cancelDialogBox,
            hintText: 'Enter a Habit name',
          );
        });
  }

  // Save New Habit
  void saveNewHabit() {
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();

    db.updateDatabase();
  }

  //Cancel new Habit/ any dialog box
  void cancelDialogBox() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  // open habit setting to edit
  void openHabitSettings(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newHabitNameController,
            onSave: () => saveExistingHabit(index),
            onCancel: cancelDialogBox,
            hintText: db.todaysHabitList[index][0],
          );
        });
  }

  // editing: save existing habit with new name
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    _newHabitNameController.clear();
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f1f2f),

      // floating action button
      floatingActionButton: MyFloatingActonButton(
        onPressed: () => createNewHabit(),
      ),

      // ListView: displaying list of habits
      body: ListView(
        children: [
          // Monthly summary for heatmap
          MonthlySummary(
              datasets: db.heatMapDataSet, startDate: _myBox.get("START_DATE")),

          // list of habits
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: db.todaysHabitList.length,
            itemBuilder: (context, index) {
              return HabitTile(
                habitName: db.todaysHabitList[index][0],
                habitCompleted: db.todaysHabitList[index][1],
                onChanged: (value) => checkBoxTapped(value!, index),
                settingsTapped: (context) => openHabitSettings(index),
                deleteTapped: (context) => deleteHabit(index),
              );
            },
          ),
        ],
      ),
    );
  }
}
