import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/views/home/filter_panel.dart';
import 'package:task_manager/views/home/task_card.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  static String message = "";

  void updateMessage(String filterName) {
    switch (filterName) {
      case MyConstants.due:
        message = 'Chúc mừng! Bạn không có công việc đến hạn trong hôm nay!';
        break;
      case MyConstants.inProgress:
        message = 'Không có công việc đang thực hiện!';
        break;
      case MyConstants.expired:
        message = 'Chúc mừng! Bạn chưa có công việc nào quá hạn!';
        break;
      case MyConstants.completed:
        message = 'Bạn chưa hoàn thành công việc nào!';
        break;
      default:
        message = 'Danh sách rỗng!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterPanel(
          showMessage: updateMessage,
        ),
        BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state.filteredTasks.isEmpty) {
              return Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                        fontFamily: MyConstants.appFont,
                        fontSize: MyConstants.mediumFontSize,
                        color: MyColors.normalText,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                children: state.filteredTasks.map((task) {
                  return TaskCard(task: task);
                }).toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
