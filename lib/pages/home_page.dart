import 'package:flutter/material.dart';
import 'package:todo_list_app/utilites/dialog_box.dart';
import 'package:todo_list_app/utilites/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//text controlller
  final _controller = TextEditingController();

  List toDOlIst = [
    ['Finish Mitch Tutorial', false],
    ['Finish App UI', false]
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDOlIst[index][1] = !toDOlIst[index][1];
    });
  }

//save new task
  void saveNewTask() {
    setState(() {
      toDOlIst.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create new task

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete Task
  void deleteTask(int index) {
    setState(() {
      toDOlIst.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          title: const Center(child: Text('TO DO')),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: toDOlIst.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: toDOlIst[index][0],
                taskCompleted: toDOlIst[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}
