import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/views/home/dashboard.dart';
import 'package:task_manager/views/home/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(
      id: 1,
      title: "Learn about Provider",
      description: "Read the documentation and demo",
      isCompleted: true,
    ),
    Task(
      id: 2,
      title: "Report",
      description: "Write report about Provider",
      isCompleted: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
      ]),
      body: ListView(children: [
        DashBoard(tasks: tasks),
        TaskList(tasks: tasks),
      ]),
    );
  }
}
