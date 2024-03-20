import 'package:flutter/material.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';

class Note extends StatelessWidget {
  const Note(
      {super.key,
      required this.color,
      required this.count,
      required this.description});
  final Color color;
  final int count;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          height: MyConstants.noteSize,
          width: MyConstants.noteSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        Text(
            "$count $description",
            style: const TextStyle(
                fontFamily: MyConstants.appFont,
                fontSize: MyConstants.mediumFontSize,
                color: MyColors.normalText),
          ),
      ],
    );
  }
}
