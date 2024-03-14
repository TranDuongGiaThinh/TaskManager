import 'package:flutter/material.dart';
import 'package:task_manager/views/home/dashboard.dart';
import 'package:task_manager/views/home/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
      ]),
      body: ListView(children: [
        DashBoard(),
        TaskList(),
      ]),
    );
  }
}
