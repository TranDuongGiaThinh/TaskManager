import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/blocs/add_task_bloc.dart';
import 'package:task_manager/presenters/add_task_presenter.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';

class EnterTaskname extends StatefulWidget {
  const EnterTaskname({
    super.key,
    required this.presenter,
    required this.name,
    required this.label,
    this.buttonName,
  });

  final AddTaskPresenter presenter;
  final String name;
  final String label;
  final String? buttonName;

  @override
  State<EnterTaskname> createState() => _EnterTasknameState();
}

class _EnterTasknameState extends State<EnterTaskname> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AddTaskState>(
        bloc: widget.presenter.taskBloc.addTaskBloc,
        builder: (context, state) {
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
                  widget.presenter.onTextField();
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
                    child:
                        widget.presenter.taskBloc.addTaskBloc.state.onTextField
                            ? TextField(
                                controller: widget.presenter.taskBloc
                                    .addTaskBloc.state.taskNameController,
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: widget.label,
                                  hintStyle: TextStyle(
                                    fontFamily: MyConstants.appFont,
                                    fontSize: MyConstants.largeFontSize,
                                    color: MyColors.normalText,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              )
                            : Text(
                                widget.label,
                                style: TextStyle(
                                  fontFamily: MyConstants.appFont,
                                  fontSize: MyConstants.largeFontSize,
                                  color: MyColors.headerText,
                                ),
                              )),
              ),
            ],
          );
        });
  }
}
