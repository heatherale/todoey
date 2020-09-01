import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/model/Task.dart';

class TaskProvider extends ChangeNotifier{

  List<Task> _tasks = [
    Task(taskName: 'Buy milk'),
    Task(taskName: 'Buy eggs'),
    Task(taskName: 'Buy cat food'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get tasksCount => _tasks.length;

  bool validate = false;

  void setValidationStatus(bool validate) {
    this.validate = validate;
    notifyListeners();
  }

  void addTask(String newTask){
    _tasks.add(Task(taskName: newTask));
    notifyListeners();
  }

  void checkTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

}