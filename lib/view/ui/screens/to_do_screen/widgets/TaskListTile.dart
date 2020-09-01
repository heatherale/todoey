import 'package:flutter/material.dart';
import 'package:todoey/model/Task.dart';

class TaskListTile extends StatelessWidget {

  Task task;
  Function onStatusChanged;

  TaskListTile(this.task, this.onStatusChanged);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
      child: CheckboxListTile(
        title: Text(task.taskName,
            style: task.isComplete ? TextStyle(
                decoration: TextDecoration.lineThrough) : null),
        controlAffinity: ListTileControlAffinity.trailing,
        value: task.isComplete,
        onChanged: this.onStatusChanged
      ),
    );
  }
}