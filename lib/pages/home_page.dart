import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/components/task_completed_badge.dart';
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

    void onCompleteTask(element) {
      taskModel.complete(element);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: List.from(taskModel.tasks.map((element) => ListTile(
            leading: element.completed
                ? TaskCompletedBadge(completed: element.completed)
                : Checkbox(
                    value: element.completed,
                    onChanged: (value) => onCompleteTask(element)),
            title: Text(element.title, style: const TextStyle(fontSize: 18))))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToCreateTask,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
