import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_model.dart';
import 'package:todo_flutter/pages/home_page.dart';
import 'package:todo_flutter/task.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => CreateTaskPageState();
}

class CreateTaskPageState extends State<CreateTaskPage> {
  bool? completed = false;
  String description = "";

  void onChangedCheckBox(bool? value) {
    setState(() {
      completed = value;
    });
  }

  void onChangedDescription(String value) {
    setState(() {
      description = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var taskModel = context.watch<TaskModel>();

    void onSave() {
      taskModel.add(Task(description, completed ?? false));

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }

    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Descrição"),
              onChanged: onChangedDescription,
            ),
            Row(
              children: [
                const Text("Completou?", style: TextStyle(fontSize: 16)),
                Checkbox(value: completed, onChanged: onChangedCheckBox)
              ],
            ),
            TextButton(
                onPressed: onSave,
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 2, horizontal: 28))),
                child: const Text(
                  "Salvar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ))
          ],
        ),
      )),
    );
  }
}
