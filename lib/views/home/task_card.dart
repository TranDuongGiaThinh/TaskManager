import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.task});
  final Task task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final List<String> menuOptions = ['Edit', 'Delete', 'Complete'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
      padding: const EdgeInsets.only(top: 0, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.task.isCompleted ? Colors.lightGreen : Colors.redAccent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.task.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              PopupMenuButton<String>(
                onSelected: handleMenuOptionSelected,
                itemBuilder: (BuildContext context) {
                  return menuOptions.map((String option) {
                    return PopupMenuItem<String>(
                      value: option,
                      child: Text(option, style: const TextStyle(fontSize: 12),),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          Text(widget.task.description, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  handleMenuOptionSelected(String option) {
    switch (option) {
      case 'Edit':
        // Edit
        break;
      case 'Delete':
        // Delete
        break;
      case 'Complete':
        // Complete
        break;
    }
  }
}
