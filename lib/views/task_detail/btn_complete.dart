import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_colors.dart';
import 'package:task_manager/info_app/my_constants.dart';

class BtnComplete extends StatefulWidget {
  const BtnComplete({super.key, required this.idTask});
  final int idTask;

  @override
  State<BtnComplete> createState() => _BtnCompleteState();
}

class _BtnCompleteState extends State<BtnComplete> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //todo
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: MyColors.primary,
          ),
          child: const Center(
            child: Text(
              MyConstants.complete,
              style: TextStyle(
                fontFamily: MyConstants.appFont,
                fontWeight: FontWeight.bold,
                fontSize: MyConstants.largeFontSize,
                color: MyColors.textInButton,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
