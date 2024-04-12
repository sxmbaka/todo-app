import 'package:hive/hive.dart';

class TodoDatabase {

  List toDoList = [];

  final _myBox = Hive.box('mybox');


  // this method is run when you first time run the app
  void createInitialData() {
    toDoList = [
      ["Do this", false, DateTime(0)],
      ["Do this too", false, DateTime(0)],
    ];
  }

  // this method is run to update the database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // this is run to update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }

}