import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/presenters/add_task_presenter.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/views/add_task/enter_date.dart';
import 'package:task_manager/views/add_task/enter_taskname.dart';
import 'package:task_manager/views/home/home_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, required this.taskBloc});
  final TaskBloc taskBloc;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  AddTaskPresenter? presenter;

  @override
  void initState() {
    super.initState();

    presenter = AddTaskPresenter(
        taskBloc: widget.taskBloc,
        gotoHome: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (presenter == null) return Container();

    return BlocBuilder<TaskBloc, TaskState>(
      bloc: widget.taskBloc,
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 10,
            padding: const EdgeInsets.only(top: 35, left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: Column(
                    children: [
                      EnterTaskname(
                        presenter: presenter!,
                        name: MyConstants.taskName,
                        label: MyConstants.enterTaskName,
                        buttonName: MyConstants.addDeadline,
                      ),
                      EnterDate(
                        name: MyConstants.startDate,
                        label: MyConstants.enterTime,
                        presenter: presenter!,
                      ),
                      EnterDate(
                        name: MyConstants.taskDeadline,
                        label: MyConstants.enterTime,
                        presenter: presenter!,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        presenter!.addTask();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: MyColors.primary,
                        ),
                        child: const Center(
                          child: Text(
                            MyConstants.addTask,
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
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
