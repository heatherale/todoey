import 'package:flutter/material.dart';
import 'package:todoey/model/Task.dart';

class TaskListTile extends StatelessWidget {

  Task task;
  final Function(bool) checkboxCallback;

  TaskListTile(this.task, this.checkboxCallback);

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
        onChanged: checkboxCallback,
      ),
    );
  }
}