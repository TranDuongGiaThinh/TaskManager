import 'package:flutter/material.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/models/task_model.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'dart:core';
import 'package:task_manager/views/task_detail/task_detail_screen.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.task});
  final Task task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late String? stateWork;
  late Color? stateColor;

  @override
  void initState() {
    super.initState();
  }

  void updateStateWork() {
    setState(() {
      stateWork = widget.task.progress == 0
          ? MyConstants.notYetDone
          : widget.task.progress == 100
              ? MyConstants.completed
              : MyConstants.inProgress;
      stateColor = calculateStateColor(stateWork);
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

  String calculateDate() {
    if (widget.task.startDate != null && stateWork == MyConstants.notYetDone) {
      return "${MyConstants.startTime} ${DateFormat('HH:mm dd/MM/yyyy').format(widget.task.startDate!)}";
    } else if (widget.task.deadline != null &&
        stateWork == MyConstants.inProgress) {
      return "${MyConstants.deadlineTime} ${DateFormat('HH:mm dd/MM/yyyy').format(widget.task.deadline!)}";
    } else if (widget.task.completionDate != null &&
        stateWork == MyConstants.completed) {
      return "${MyConstants.completionTime} ${DateFormat('HH:mm dd/MM/yyyy').format(widget.task.completionDate!)}";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    updateStateWork();
    if (stateWork == null) return Container();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailScreen(task: widget.task),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        height: MyConstants.taskCardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.taskCard,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MyConstants.progressCircleSize,
              height: MyConstants.progressCircleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: stateColor!, width: 5),
              ),
              child: Center(
                child: Text(
                  "${widget.task.progress}%",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: MyConstants.appFont,
                    fontSize: MyConstants.mediumFontSize,
                    color: MyColors.headerText,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      stateWork!,
                      style: TextStyle(
                        fontFamily: MyConstants.appFont,
                        fontWeight: FontWeight.bold,
                        fontSize: MyConstants.largeFontSize,
                        color: stateColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.task.name,
                      style: const TextStyle(
                        fontFamily: MyConstants.appFont,
                        fontWeight: FontWeight.bold,
                        fontSize: MyConstants.mediumFontSize,
                        color: MyColors.headerText,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      calculateDate(),
                      style: TextStyle(
                        fontFamily: MyConstants.appFont,
                        fontSize: MyConstants.smallFontSize,
                        color: widget.task.deadline != null
                            ? widget.task.isExpired()
                                ? MyColors.redPoint
                                : MyColors.normalText
                            : MyColors.normalText,
                      ),
                    ),
                  ),
                  const Divider(
                      thickness: MyConstants.taskCardDividerThickness),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
