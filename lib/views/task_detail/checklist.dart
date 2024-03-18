import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_colors.dart';
import 'package:task_manager/info_app/my_constants.dart';
import 'package:task_manager/models/checklist_item_model.dart';
import 'package:task_manager/views/task_detail/checklist_card.dart';

class Checklist extends StatefulWidget {
  const Checklist({super.key, required this.idTask});
  final int idTask;

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  List<ChecklistItem> checklist = [];

  @override
  void initState() {
    super.initState();
    getChecklist();
  }

  void getChecklist() {
    setState(() {
      checklist = [
        ChecklistItem(
          id: 1,
          idTask: 1,
          name: "Thiết kế màn hình trang chủ",
          completed: true,
        ),
        ChecklistItem(
          id: 1,
          idTask: 1,
          name: "Thiết kế màn hình chi tiết",
          completed: false,
        ),
        ChecklistItem(
          id: 1,
          idTask: 1,
          name: "Thiết kế màn hình thêm mới",
          completed: false,
        ),
      ];
    });
  }

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
        for (int i = 0; i < checklist.length; i++)
          CheckListCard(item: checklist[i]),
      ],
    );
  }
}
