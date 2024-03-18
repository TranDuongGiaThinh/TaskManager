import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_colors.dart';
import 'package:task_manager/info_app/my_constants.dart';
import 'package:task_manager/models/charts_model.dart';
import 'package:task_manager/views/home/note.dart';
// ignore: depend_on_referenced_packages
import 'package:charts_flutter/flutter.dart' as charts;

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<charts.Series<ChartsModel, String>> seriesPieData = [];

  int getProgressToday() {
    return 33;
  }

  int countDueTask() {
    return 2;
  }

  int countNotYetDoneTask() {
    return 3;
  }

  int countInProgressTask() {
    return 2;
  }

  int countCompletedTask() {
    return 1;
  }

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  void _generateData() {
    List<ChartsModel> data = [
      ChartsModel(MyConstants.due, countDueTask(), MyColors.due),
      ChartsModel(
          MyConstants.notYetDone, countNotYetDoneTask(), MyColors.notYetDone),
      ChartsModel(
          MyConstants.inProgress, countInProgressTask(), MyColors.inProgress),
      ChartsModel(
          MyConstants.completed, countCompletedTask(), MyColors.completed),
    ];

    seriesPieData.add(
      charts.Series(
        data: data,
        domainFn: (ChartsModel model, _) {
          return model.description;
        },
        measureFn: (ChartsModel model, _) {
          return model.count.toDouble() / ChartsModel.countTotal;
        },
        colorFn: (ChartsModel model, _) =>
            charts.ColorUtil.fromDartColor(model.color),
        id: 'Tasks',
        labelAccessorFn: (ChartsModel model, _) => '${model.count}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      width: MediaQuery.of(context).size.width,
      color: MyColors.dashboard,
      child: Column(
        children: [
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/2,
                child: SizedBox(
                  height: MyConstants.chartSize,
                  width: MyConstants.chartSize,
                  child: charts.PieChart(
                    seriesPieData,
                    defaultInteractions: false,
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
        ],
      ),
    );
  }
}
