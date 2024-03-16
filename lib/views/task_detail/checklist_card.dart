import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_colors.dart';
import 'package:task_manager/info_app/my_constants.dart';
import 'package:task_manager/info_app/my_icon.dart';
import 'package:task_manager/models/checklist_item_model.dart';

class CheckListCard extends StatefulWidget {
  const CheckListCard({super.key, required this.item});
  final ChecklistItem item;

  @override
  State<CheckListCard> createState() => _CheckListCardState();
}

class _CheckListCardState extends State<CheckListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: [
        if (widget.item.completed)
          const Icon(MyIcon.checkedBox, color: MyColors.primary)
        else
          const Icon(MyIcon.box, color: MyColors.iconUnchecked),
        const SizedBox(width: 10),
        Text(
          widget.item.name,
          style: const TextStyle(
            fontFamily: MyConstants.appFont,
            fontSize: MyConstants.largeFontSize,
            color: MyColors.headerText,
          ),
        )
      ]),
    );
  }
}
