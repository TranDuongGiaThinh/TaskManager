import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/views/home/filter_panel.dart';
import 'package:task_manager/views/home/task_card.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const FilterPanel(),
      for (int i = 0; i < 1; i++)
        TaskCard(
          task: Task(
            id: 1,
            idUser: 1,
            name: "Thiết kế giao diện",
            progress: 100,
            startDate: DateTime(2024, 03, 15, 9, 0),
            deadline: DateTime(2024, 03, 17, 23, 59),
            completionDate: DateTime(2024, 03, 16, 10, 30),
          ),
        ),
        TaskCard(
          task: Task(
            id: 1,
            idUser: 1,
            name: "Code giao diện",
            progress: 33,
            startDate: DateTime(2024, 03, 15, 9, 0),
            deadline: DateTime(2024, 03, 17, 23, 59),
            completionDate: DateTime(2024, 03, 16, 10, 30),
          ),
        ),
        TaskCard(
          task: Task(
            id: 1,
            idUser: 1,
            name: "Xử lý sự kiện",
            progress: 0,
            startDate: DateTime(2024, 03, 18, 9, 0),
            deadline: DateTime(2024, 03, 19, 23, 59),
          ),
        ),
    ]);
  }
}
