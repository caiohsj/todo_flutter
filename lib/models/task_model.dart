import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_flutter/task.dart';

class TaskModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void complete(Task task) {
    var index = _tasks.indexOf(task);
    _tasks[index].completed = true;
    notifyListeners();
  }

  void removeAll() {
    _tasks.clear();
    notifyListeners();
  }
}
