import 'package:flutter/material.dart';
import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/utils/my_icon.dart';
import 'package:task_manager/views/add_task/add_task_screen.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key, required this.taskBloc});
  final TaskBloc taskBloc;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: MyColors.appbar,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Todo
            },
            child: const Icon(
              MyIcon.search,
              color: MyColors.headerText,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Todo
              },
              child: const Text(
                MyConstants.search,
                style: TextStyle(
                  fontFamily: MyConstants.appFont,
                  fontSize: MyConstants.largeFontSize,
                  fontWeight: FontWeight.bold,
                  color: MyColors.headerText,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Todo
            },
            child: const Icon(
              MyIcon.notification,
              color: MyColors.headerText,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddTaskScreen(taskBloc: widget.taskBloc),
                ),
              );
            },
            child: const Icon(
              MyIcon.add,
              color: MyColors.headerText,
            ),
          ),
        ],
      ),
    );
  }
}
