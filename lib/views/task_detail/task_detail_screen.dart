import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/views/task_detail/btn_complete.dart';
import 'package:task_manager/views/task_detail/checklist.dart';
import 'package:task_manager/views/task_detail/task_info.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key, required this.task});
  final Task task;

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding:
              const EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios),
              ),
              TaskInfo(task: widget.task),
              const SizedBox(height: 5),
              Expanded(child: Checklist(idTask: widget.task.id)),
              const SizedBox(height: 5),
              BtnComplete(idTask: widget.task.id)
            ],
          )),
    );
  }
}
