import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_colors.dart';
import 'package:task_manager/info_app/my_constants.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/views/home/note.dart';
// ignore: depend_on_referenced_packages
import 'package:charts_flutter/flutter.dart' as charts;

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<charts.Series<Task, String>> seriesPieData = [];

  int getProgressToday() {
    return 10;
  }

  int countDueTask() {
    return 1;
  }

  int countNotYetDoneTask() {
    return 2;
  }

  int countInProgressTask() {
    return 3;
  }

  int countCompletedTask() {
    return 4;
  }

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  void _generateData() {
    var data = [
      Task(id: 1, idUser: 1, name: MyConstants.due, progress: countDueTask()),
      Task(
        id: 2,
        idUser: 1,
        name: "Code giao diện",
        progress: 33,
        startDate: DateTime(2024, 03, 15, 9, 0),
        deadline: DateTime(2024, 03, 17, 23, 59),
      ),
      Task(
        id: 1,
        idUser: 1,
        name: "Thiết kế giao diện",
        progress: 100,
        startDate: DateTime(2024, 03, 15, 9, 0),
        deadline: DateTime(2024, 03, 17, 23, 59),
        completionDate: DateTime(2024, 03, 16, 10, 30),
      ),
      Task(
        id: 3,
        idUser: 1,
        name: "Xử lý sự kiện",
        progress: 0,
        startDate: DateTime(2024, 03, 18, 9, 0),
        deadline: DateTime(2024, 03, 19, 23, 59),
      ),
    ];

    seriesPieData.add(
      charts.Series(
        data: data,
        domainFn: (Task task, _) => task.name,
        measureFn: (Task task, _) => task.progress,
        id: 'Tasks',
        labelAccessorFn: (Task task, _) => '${task.progress}',
      ),
    );
  }

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
                "${MyConstants.completed} ${getProgressToday()}% ${MyConstants.today.toLowerCase()} >",
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
            //biểu đồ tròn
            Container(
              margin: const EdgeInsets.all(5),
              height: MyConstants.chartSize,
              width: MyConstants.chartSize,
              child: charts.PieChart(
                seriesPieData,
                animate: true,
                animationDuration: const Duration(milliseconds: 500),
                defaultRenderer: charts.ArcRendererConfig(
                  arcWidth: 60,
                  arcRendererDecorators: [
                    charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.auto,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Note(
                  color: MyColors.due,
                  count: countDueTask(),
                  description: MyConstants.due,
                ),
                Note(
                  color: MyColors.notYetDone,
                  count: countNotYetDoneTask(),
                  description: MyConstants.notYetDone,
                ),
                Note(
                  color: MyColors.inProgress,
                  count: countInProgressTask(),
                  description: MyConstants.inProgress,
                ),
                Note(
                  color: MyColors.completed,
                  count: countCompletedTask(),
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
