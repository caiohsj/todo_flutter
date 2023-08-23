import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_flutter/task.dart';

class TaskModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void add(Task task) {
    _tasks.add(task);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _tasks.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
