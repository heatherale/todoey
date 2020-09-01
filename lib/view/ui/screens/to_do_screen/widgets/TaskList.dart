import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/GetIt.dart';
import 'package:todoey/model/Task.dart';
import 'package:todoey/provider/TaskProvider.dart';
import 'TaskListTile.dart';

class TaskList extends StatelessWidget {

  //final taskProvider = getIt<TaskProvider>();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, _){
        return ListView.builder(itemBuilder: (context, index){
          final Task currentTask = taskProvider.tasks[index];
          return TaskListTile(currentTask,
                  (checkboxState) => taskProvider.checkTask(currentTask));
        },
          itemCount: taskProvider.tasksCount,
        );
      }

    );
  }
}
