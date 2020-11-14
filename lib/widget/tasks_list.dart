import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/widget/task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy Egg', isDone: true),
    Task(name: 'Buy bread', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkBoxCallBack: (checkBoxState) {
            setState(() {
              tasks[index].toogleDone();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}