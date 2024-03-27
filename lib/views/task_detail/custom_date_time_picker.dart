import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/utils/my_icon.dart';

class CustomDateTimePicker extends StatefulWidget {
  const CustomDateTimePicker(
      {Key? key,
      required this.type,
      required this.datetime,
      required this.isEditting,
      this.onDateTimeChanged})
      : super(key: key);

  final String type;
  final DateTime datetime;
  final bool isEditting;
  final Function(DateTime)? onDateTimeChanged;

  @override
  _CustomDateTimePickerState createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  late DateTime selectedDateTime;

  @override
  void initState() {
    super.initState();
    selectedDateTime = widget.datetime;
  }

  Future<void> selectDateTime(BuildContext context) async {
    if (widget.isEditting == false) return;
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime),
      );
      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
        widget.onDateTimeChanged!(selectedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectDateTime(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            MyIcon.watch,
            color: MyColors.normalText,
          ),
          SizedBox(width: 8),
          Text(
            '${widget.type} ${DateFormat('HH:mm dd/MM/yyyy').format(selectedDateTime)}',
            style: TextStyle(
              fontFamily: MyConstants.appFont,
              fontSize: MyConstants.mediumFontSize,
              color: MyColors.normalText,
            ),
          ),
          SizedBox(width: 8),
          if (widget.isEditting)
            Icon(
              MyIcon.edit,
              color: MyColors.normalText,
            ),
        ],
      ),
    );
  }
}
