import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/utils/my_icon.dart';

class DateTimePickerWidget extends StatefulWidget {
  const DateTimePickerWidget({super.key, required this.isDeadline});
  final bool isDeadline;

  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime deadline = DateTime.now();
  DateTime startDate = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.isDeadline ? deadline : startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime:
            TimeOfDay.fromDateTime(widget.isDeadline ? deadline : startDate),
      );
      if (pickedTime != null) {
        setState(
          () {
            if (widget.isDeadline) {
              deadline = DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
                pickedTime.hour,
                pickedTime.minute,
              );
            } else {
              startDate = DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
                pickedTime.hour,
                pickedTime.minute,
              );
            }
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDateTime(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(MyIcon.watch),
          SizedBox(width: 8),
          Text(
            '${DateFormat('HH:mm dd/MM/yyyy').format(widget.isDeadline ? deadline : startDate)}',
          ),
        ],
      ),
    );
  }
}
