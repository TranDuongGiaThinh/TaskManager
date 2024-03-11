import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/views/home/task_card.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < widget.tasks.length; i++)
        TaskCard(task: widget.tasks[i])
    ]);
  }
}
