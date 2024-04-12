import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/todo_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');

  final _controller = TextEditingController();

  TodoDatabase db = TodoDatabase();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        db.toDoList.add([_controller.text, false, DateTime.now()]);
      }
    });
    _controller.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void editTask() {}

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          onClear: () => _controller.clear(),
        );
      },
    );
    db.updateDatabase();
  }

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      // no data present
      db.createInitialData();
    } else {
      // data was present
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text(
          "todo",
          style: GoogleFonts.ubuntu(fontSize: 30, color: Colors.redAccent),
        ),
        shadowColor: Colors.black,
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        elevation: 4,
        mini: false,
        tooltip: "Add A Task.",
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoListTile(
            taskName: db.toDoList[index][0],
            isTaskComplete: db.toDoList[index][1],
            dateTimeCreated: db.toDoList[index][2],
            onChanged: (value) => checkBoxChanged(value, index),
            onDelete: (context) => deleteTask(index),
            onEdit: editTask,
          );
        },
      ),
    );
  }
}
