import 'package:flutter/material.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/models/checklist_item_model.dart';
import 'package:task_manager/views/task_detail/checklist_card.dart';

class Checklist extends StatefulWidget {
  const Checklist(
      {super.key, required this.checklist, required this.checkedChecklistItem});
  final List<ChecklistItem> checklist;
  final Function(ChecklistItem) checkedChecklistItem;

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          MyConstants.checklist,
          style: TextStyle(
            fontFamily: MyConstants.appFont,
            fontSize: MyConstants.largeFontSize,
            fontWeight: FontWeight.bold,
            color: MyColors.primary,
          ),
        ),
        for (int i = 0; i < widget.checklist.length; i++)
          CheckListCard(
            item: widget.checklist[i],
            checkedChecklistItem: (checklistItem) {widget.checkedChecklistItem(checklistItem);},
          ),
      ],
    );
  }
}
