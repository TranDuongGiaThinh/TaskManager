import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_colors.dart';
import 'package:task_manager/info_app/my_constants.dart';
import 'package:task_manager/models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Task task = Task.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -10,
        padding: const EdgeInsets.only(top: 35, left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        MyConstants.taskName,
                        style: TextStyle(
                          fontFamily: MyConstants.appFont,
                          fontSize: MyConstants.largeFontSize,
                          fontWeight: FontWeight.bold,
                          color: MyColors.primary,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      //todo
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 5,bottom: 5),
                      padding: const EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyColors.inputBackground,
                      ),
                      child: const Text(
                        MyConstants.enterTaskName,
                        style: TextStyle(
                          fontFamily: MyConstants.appFont,
                          fontSize: MyConstants.largeFontSize,
                          color: MyColors.headerText,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //todo
                        },
                        child: const Text(
                          "+ ${MyConstants.addDeadline}",
                          style: TextStyle(
                            fontFamily: MyConstants.appFont,
                            fontSize: MyConstants.largeFontSize,
                            color: MyColors.primary,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    //todo
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyColors.primary,
                    ),
                    child: const Center(
                      child: Text(
                        MyConstants.addTask,
                        style: TextStyle(
                          fontFamily: MyConstants.appFont,
                          fontWeight: FontWeight.bold,
                          fontSize: MyConstants.largeFontSize,
                          color: MyColors.textInButton,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
