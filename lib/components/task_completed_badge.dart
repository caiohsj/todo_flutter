import 'package:flutter/material.dart';

class TaskCompletedBadge extends StatelessWidget {
  const TaskCompletedBadge({super.key, required this.completed});

  final bool completed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60,
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: completed ? Colors.blue[400] : Colors.red[400],
                borderRadius: BorderRadius.circular(10)),
            child: const Text("Feito",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white))));
  }
}
