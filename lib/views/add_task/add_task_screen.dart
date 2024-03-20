import 'package:flutter/material.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/views/add_task/custom_input.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? deadline = DateTime.now();
  DateTime? startDate =DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 10,
        padding: const EdgeInsets.only(top: 35, left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            Expanded(
              child: Column(
                children: [
                  CustomInput(
                    name: MyConstants.taskName,
                    label: MyConstants.enterTaskName,
                    buttonName:
                        deadline != null ? null : MyConstants.addDeadline,
                  ),
                  if (deadline != null)
                    CustomInput(
                      name: MyConstants.taskDeadline,
                      label: MyConstants.enterTime,
                      buttonName:
                          startDate != null ? null : MyConstants.addStartDate,
                    ),
                  if (startDate != null)
                    CustomInput(
                      name: MyConstants.startDate,
                      label: MyConstants.enterTime,
                    ),
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
