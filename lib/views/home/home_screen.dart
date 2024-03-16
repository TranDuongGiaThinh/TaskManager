import 'package:flutter/material.dart';
import 'package:task_manager/views/home/custom_appbar.dart';
import 'package:task_manager/views/home/dashboard.dart';
import 'package:task_manager/views/home/info_user.dart';
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
      body: ListView(children: const [
        CustomAppbar(),
        InfoUser(),
        DashBoard(),
        TaskList(),
      ]),
    );
  }
}
