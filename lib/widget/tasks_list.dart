import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/widget/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkBoxCallBack: (checkBoxState) {
            setState(() {
              widget.tasks[index].toogleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}