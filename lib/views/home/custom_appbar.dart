import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_colors.dart';
import 'package:task_manager/info_app/my_constants.dart';
import 'package:task_manager/info_app/my_icon.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

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
              // Todo
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
