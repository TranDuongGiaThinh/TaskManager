import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:const Text("DashBoard"),
    );
  }
}
