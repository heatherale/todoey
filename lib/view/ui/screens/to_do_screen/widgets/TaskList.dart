import 'package:flutter/material.dart';
import 'package:todoey/model/Task.dart';

import 'TaskListTile.dart';

class TaskList extends StatefulWidget {

  List<Task> tasks;

  TaskList(this.tasks);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      return TaskListTile(widget.tasks[index], (_){
        setState(() {
          widget.tasks[index].toggleDone();
        });
      });
    },
      itemCount: widget.tasks.length,
    );
  }
}
