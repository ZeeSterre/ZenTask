import 'package:hive_flutter/hive_flutter.dart';

class ZenTaskDatabase {
  List toDoList = [];

  // reference naar box

  final _myBox = Hive.box('mybox');

  // method for first time ever opening this app.
  void createInitialData() {
    toDoList = [
      ["Mediteren", false],
      ["Sporten", false],
    ];
  }

  // data laden van database

  void loadData() {
    toDoList = _myBox.get("TO_DO_LIST");
  }

  // database updaten

  void updateDataBase() {
    _myBox.put("TO_DO_LIST", toDoList);
  }
}
