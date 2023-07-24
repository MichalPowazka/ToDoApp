import 'package:flutter/material.dart';
import '../components/todo_tile.dart';
import 'NewToDo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();

  //list of to do tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save new task
  void savedNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.pop(context);
  }

  // crate a new task
  void createNewTask() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewToDo(
          controller: _controller,
          onSave: savedNewTask,
        ), //
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        centerTitle: true,
        title: Text('To Do'),
        elevation: 0,
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(30),
        child: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
