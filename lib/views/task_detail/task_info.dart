import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/blocs/task_detail_bloc.dart';
import 'package:task_manager/presenters/task_detail_presenter.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/utils/my_icon.dart';
import 'package:task_manager/views/task_detail/custom_date_time_picker.dart';

class TaskInfo extends StatefulWidget {
  const TaskInfo({super.key, required this.presenter, required this.gotoHome});
  final Function() gotoHome;
  final TaskDetailPresenter presenter;

  @override
  State<TaskInfo> createState() => _TaskInfoState();
}

class _TaskInfoState extends State<TaskInfo> {
  String? stateTask;
  Color? stateColor;

  void updateStateTask() {
    stateTask = widget.presenter.taskBloc.taskDetailBloc!.state.task.progress ==
            0
        ? MyConstants.notYetDone
        : widget.presenter.taskBloc.taskDetailBloc!.state.task.progress == 100
            ? MyConstants.completed
            : MyConstants.inProgress;
    stateColor = calculateStateColor(stateTask);
  }

  Color calculateStateColor(String? stateWork) {
    if (stateWork == MyConstants.notYetDone) {
      return MyColors.notYetDone;
    } else if (stateWork == MyConstants.inProgress) {
      return MyColors.inProgress;
    } else if (stateWork == MyConstants.completed) {
      return MyColors.completed;
    }
    return Colors.transparent;
  }

  onClickPopupMenuButton(int selectedIndex) {
    switch (selectedIndex) {
      case 1:
        widget.presenter.onEdittingInfo(true);
        break;
      case 2:
        widget.presenter.onEdittingChecklist(true);
        break;
      case 3:
        widget.presenter.deletedTask();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailBloc, TaskDetailState>(
        bloc: widget.presenter.taskBloc.taskDetailBloc,
        builder: (context, state) {
          updateStateTask();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: widget.gotoHome,
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    stateTask!,
                    style: TextStyle(
                      fontFamily: MyConstants.appFont,
                      fontSize: MyConstants.largeFontSize,
                      fontWeight: FontWeight.bold,
                      color: stateColor,
                    ),
                  ),
                  PopupMenuButton<int>(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text(
                          MyConstants.editTaskInfo,
                          style: TextStyle(
                            fontFamily: MyConstants.appFont,
                            fontSize: MyConstants.mediumFontSize,
                            color: MyColors.headerText,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text(
                          MyConstants.editChecklist,
                          style: TextStyle(
                            fontFamily: MyConstants.appFont,
                            fontSize: MyConstants.mediumFontSize,
                            color: MyColors.headerText,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text(
                          MyConstants.deletedTask,
                          style: TextStyle(
                            fontFamily: MyConstants.appFont,
                            fontSize: MyConstants.mediumFontSize,
                            color: MyColors.headerText,
                          ),
                        ),
                      ),
                    ],
                    onSelected: (selectedIndex) {
                      onClickPopupMenuButton(selectedIndex);
                    },
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.progressBackground,
                    ),
                    child: const Text(
                      MyConstants.empty,
                      style: TextStyle(
                        fontFamily: MyConstants.appFont,
                        fontSize: MyConstants.mediumFontSize,
                        color: MyColors.headerText,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        (widget.presenter.taskBloc.taskDetailBloc!.state.task
                                .progress /
                            100.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: stateColor,
                    ),
                    child: Center(
                      child: Text(
                        "${widget.presenter.taskBloc.taskDetailBloc!.state.task.progress}%",
                        style: const TextStyle(
                          fontFamily: MyConstants.appFont,
                          fontSize: MyConstants.mediumFontSize,
                          fontWeight: FontWeight.bold,
                          color: MyColors.headerText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (widget
                  .presenter.taskBloc.taskDetailBloc!.state.isFocusTextField)
                Container(
                  height: 30,
                  child: TextField(
                    controller: widget.presenter.taskBloc.taskDetailBloc!.state
                        .taskNameController,
                    autofocus: true,
                    style: TextStyle(
                      fontFamily: MyConstants.appFont,
                      fontWeight: FontWeight.bold,
                      fontSize: MyConstants.largeFontSize,
                      color: MyColors.headerText,
                    ),
                    decoration: InputDecoration(
                      hintText: state.taskNameController.text,
                      hintStyle: TextStyle(
                        fontFamily: MyConstants.appFont,
                        fontWeight: FontWeight.bold,
                        fontSize: MyConstants.largeFontSize,
                        color: MyColors.headerText,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      suffixIcon: GestureDetector(
                        onTap: widget.presenter.saveTaskName,
                        child: Icon(
                          MyIcon.save,
                          color: MyColors.headerText,
                        ),
                      ),
                    ),
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.presenter.taskBloc.taskDetailBloc!.state.task.name,
                      style: const TextStyle(
                        fontFamily: MyConstants.appFont,
                        fontWeight: FontWeight.bold,
                        fontSize: MyConstants.largeFontSize,
                        color: MyColors.headerText,
                      ),
                    ),
                    if (widget.presenter.taskBloc.taskDetailBloc!.state
                        .isEdittingInfo)
                      GestureDetector(
                        onTap: () {
                          widget.presenter.onfocusTextField(true);
                        },
                        child: Icon(
                          MyIcon.edit,
                          color: MyColors.headerText,
                        ),
                      ),
                  ],
                ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.presenter.taskBloc.taskDetailBloc!.state.task
                            .startDate !=
                        null)
                      CustomDateTimePicker(
                        type: MyConstants.startTime,
                        datetime: widget.presenter.taskBloc.taskDetailBloc!
                            .state.task.startDate!,
                        isEditting: widget.presenter.taskBloc.taskDetailBloc!
                            .state.isEdittingInfo,
                        onDateTimeChanged: widget.presenter.taskBloc
                                .taskDetailBloc!.state.isEdittingInfo
                            ? (value) {
                                widget.presenter.saveSartDate(value);
                              }
                            : null,
                      ),
                    if (widget.presenter.taskBloc.taskDetailBloc!.state.task
                            .deadline !=
                        null)
                      CustomDateTimePicker(
                        type: MyConstants.deadlineTime,
                        datetime: widget.presenter.taskBloc.taskDetailBloc!
                            .state.task.deadline!,
                        isEditting: widget.presenter.taskBloc.taskDetailBloc!
                            .state.isEdittingInfo,
                        onDateTimeChanged: widget.presenter.taskBloc
                                .taskDetailBloc!.state.isEdittingInfo
                            ? (value) {
                                widget.presenter.saveDeadline(value);
                              }
                            : null,
                      ),
                    if (widget.presenter.taskBloc.taskDetailBloc!.state.task
                            .completionDate !=
                        null)
                      CustomDateTimePicker(
                          type: MyConstants.completionTime,
                          datetime: widget.presenter.taskBloc.taskDetailBloc!
                              .state.task.completionDate!,
                          isEditting: false,
                          onDateTimeChanged: null),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
