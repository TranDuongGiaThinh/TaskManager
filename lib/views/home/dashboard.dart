import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_colors.dart';
import 'package:task_manager/info_app/my_constants.dart';
import 'package:task_manager/info_app/my_icon.dart';
import 'package:task_manager/views/home/note.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int progress = 35;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      width: MediaQuery.of(context).size.width,
      color: MyColors.primary,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              MyConstants.statisticalWork,
              style: TextStyle(
                fontFamily: MyConstants.appFont,
                fontSize: MyConstants.largeFontSize,
                color: MyColors.normalText,
              ),
            ),
            GestureDetector(
              onTap: () {
                //todo
              },
              child: Text(
                "${MyConstants.completed} $progress% ${MyConstants.today.toLowerCase()} >",
                style: const TextStyle(
                  fontFamily: MyConstants.appFont,
                  fontSize: MyConstants.largeFontSize,
                  color: MyColors.normalText,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              height: MyConstants.chartSize,
              width: MyConstants.chartSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.completed,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Note(
                  color: MyColors.due,
                  count: 0,
                  description: MyConstants.due,
                ),
                Note(
                  color: MyColors.notYetDone,
                  count: 0,
                  description: MyConstants.notYetDone,
                ),
                Note(
                  color: MyColors.inProgress,
                  count: 0,
                  description: MyConstants.inProgress,
                ),
                Note(
                  color: MyColors.completed,
                  count: 1,
                  description: MyConstants.completed,
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
