import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_model.dart';
import 'package:todo_flutter/pages/create_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String title = "TODO App";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToCreateTask() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CreateTaskPage()));
  }

  @override
  Widget build(BuildContext context) {
    var taskModel = context.watch<TaskModel>();

    void onToggleComplete(element) {
      taskModel.toggle(element);
    }

    return Scaffold(
      body: ListView(
        children: List.from(taskModel.tasks.map((element) => ListTile(
            leading: Checkbox(
                value: element.completed,
                onChanged: (value) => onToggleComplete(element)),
            title: Text(element.title, style: const TextStyle(fontSize: 18))))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToCreateTask,
        tooltip: 'Add Task',
        backgroundColor: Colors.blue[400],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
