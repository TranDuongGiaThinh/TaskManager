import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_constants.dart';
import 'package:task_manager/views/add_task/add_task_screen.dart';
import 'package:task_manager/views/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const AddTaskScreen(),
    );
  }
}