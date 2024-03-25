import 'package:flutter/material.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/utils/my_icon.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/views/task_detail/custom_date_time_picker.dart';

class TaskInfo extends StatefulWidget {
  const TaskInfo({super.key, required this.task});
  final Task task;

  @override
  State<TaskInfo> createState() => _TaskInfoState();
}

class _TaskInfoState extends State<TaskInfo> {
  String? stateTask;
  Color? stateColor;

  @override
  void initState() {
    super.initState();
    updateStateTask();
  }

  void updateStateTask() {
    setState(() {
      stateTask = widget.task.progress == 0
          ? MyConstants.notYetDone
          : widget.task.progress == 100
              ? MyConstants.completed
              : MyConstants.inProgress;
      stateColor = calculateStateColor(stateTask);
    });
  }

  Color calculateStateColor(String? stateWork) {
    if (stateWork == MyConstants.notYetDone) {
      return MyColors.notYetDone;
    } else if (stateWork == MyConstants.inProgress) {
      return MyColors.inProgress;
    } else if (stateWork == MyConstants.completed) {
      return MyColors.completed;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              stateTask!,
              style: TextStyle(
                fontFamily: MyConstants.appFont,
                fontSize: MyConstants.largeFontSize,
                fontWeight: FontWeight.bold,
                color: stateColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                //todo
              },
              child: const Icon(MyIcon.more),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.progressBackground,
              ),
              child: const Text(
                MyConstants.empty,
                style: TextStyle(
                  fontFamily: MyConstants.appFont,
                  fontSize: MyConstants.mediumFontSize,
                  color: MyColors.headerText,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width *
                  (widget.task.progress / 100.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: stateColor,
              ),
              child: Center(
                child: Text(
                  "${widget.task.progress}%",
                  style: const TextStyle(
                    fontFamily: MyConstants.appFont,
                    fontSize: MyConstants.mediumFontSize,
                    fontWeight: FontWeight.bold,
                    color: MyColors.headerText,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          widget.task.name,
          style: const TextStyle(
            fontFamily: MyConstants.appFont,
            fontWeight: FontWeight.bold,
            fontSize: MyConstants.largeFontSize,
            color: MyColors.headerText,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.task.startDate != null)
                CustomDateTimePicker(
                    type: MyConstants.startTime,
                    datetime: widget.task.startDate!,
                    onDateTimeChanged: (a) {
                      //todo
                    }),
              if (widget.task.deadline != null)
                CustomDateTimePicker(
                    type: MyConstants.deadlineTime,
                    datetime: widget.task.deadline!,
                    onDateTimeChanged: (a) {
                      //todo
                    }),
              if (widget.task.completionDate != null)
                CustomDateTimePicker(
                    type: MyConstants.completionTime,
                    datetime: widget.task.completionDate!,
                    onDateTimeChanged: (a) {
                      //todo
                    }),
            ],
          ),
        ),
      ],
    );
  }
}
