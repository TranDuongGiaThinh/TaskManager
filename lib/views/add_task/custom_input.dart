import 'package:flutter/material.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/views/add_task/date_picker.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    required this.name,
    required this.label,
    this.buttonName,
  });

  final String name;
  final String label;
  final String? buttonName;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.name,
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
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            padding: const EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyColors.inputBackground,
            ),
            child: widget.name == MyConstants.taskName
                ? Text(
                    widget.label,
                    style: TextStyle(
                      fontFamily: MyConstants.appFont,
                      fontSize: MyConstants.largeFontSize,
                      color: MyColors.headerText,
                    ),
                  )
                : DateTimePickerWidget(
                    isDeadline: widget.name == MyConstants.taskDeadline,
                  ),
          ),
        ),
        if (widget.buttonName != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  //todo
                },
                child: Text(
                  "+ ${widget.buttonName}",
                  style: TextStyle(
                    fontFamily: MyConstants.appFont,
                    fontSize: MyConstants.largeFontSize,
                    color: MyColors.primary,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
