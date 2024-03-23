import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/models/charts_model.dart';
import 'package:task_manager/views/home/note.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      bloc: BlocProvider.of<TaskBloc>(context),
      builder: (context, state) {
        if (state.allTasks.isEmpty) {
          return Container();
        } else {
          return buildDashboard(state.allTasks);
        }
      },
    );
  }

  Widget buildDashboard(List<Task> tasks) {
    List<charts.Series<ChartsModel, String>> seriesPieData = [];
    List<ChartsModel> data = [
      ChartsModel(MyConstants.due, countDueTask(tasks), MyColors.due),
      ChartsModel(MyConstants.notYetDone, countNotYetDoneTask(tasks),
          MyColors.notYetDone),
      ChartsModel(MyConstants.inProgress, countInProgressTask(tasks),
          MyColors.inProgress),
      ChartsModel(
          MyConstants.completed, countCompletedTask(tasks), MyColors.completed),
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
                  "${MyConstants.completed} ${getProgressToday(tasks)}% ${MyConstants.today.toLowerCase()} >",
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
                width: MediaQuery.of(context).size.width / 2,
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
                    count: countDueTask(tasks),
                    description: MyConstants.due,
                  ),
                  Note(
                    color: MyColors.notYetDone,
                    count: countNotYetDoneTask(tasks),
                    description: MyConstants.notYetDone,
                  ),
                  Note(
                    color: MyColors.inProgress,
                    count: countInProgressTask(tasks),
                    description: MyConstants.inProgress,
                  ),
                  Note(
                    color: MyColors.completed,
                    count: countCompletedTask(tasks),
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

  int countDueTask(List<Task> tasks) {
    return tasks.where((task) {
      return task.isDue();
    }).length;
  }

  double getProgressToday(List<Task> tasks) {
    int count = countDueTask(tasks);
    if (count == 0) return 100;

    int progressTotal = 0;
    for (int i = 0; i < tasks.length; i++)
      if (tasks[i].isDue()) progressTotal += tasks[i].progress;

    return progressTotal / count.toDouble();
  }

  int countNotYetDoneTask(List<Task> tasks) {
    return tasks.where((task) => task.progress == 0).length;
  }

  int countInProgressTask(List<Task> tasks) {
    return tasks
        .where((task) => task.progress > 0 && task.progress < 100)
        .length;
  }

  int countCompletedTask(List<Task> tasks) {
    return tasks.where((task) => task.completionDate != null).length;
  }
}
