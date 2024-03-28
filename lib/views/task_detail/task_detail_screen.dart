import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/presenters/task_detail_presenter.dart';
import 'package:task_manager/views/home/home_screen.dart';
import 'package:task_manager/views/task_detail/btn_complete.dart';
import 'package:task_manager/views/task_detail/checklist.dart';
import 'package:task_manager/views/task_detail/task_info.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key, required this.task});
  final Task task;

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  TaskDetailPresenter? presenter;

  @override
  void initState() {
    super.initState();

    load();
  }

  void load() {
    presenter = TaskDetailPresenter(
        task: widget.task,
        taskBloc: BlocProvider.of<TaskBloc>(context),
        gotoHome: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (presenter != null) if (presenter!
            .taskBloc.taskDetailBloc!.state.task.id !=
        widget.task.id) load();
    return BlocBuilder<TaskBloc, TaskState>(
      bloc: presenter!.taskBloc,
      builder: (context, state) {
        if (presenter == null) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: Container(
              padding: const EdgeInsets.only(
                  top: 35, left: 10, right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskInfo(
                    presenter: presenter!,
                    gotoHome: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Checklist(
                      presenter: presenter!,
                    ),
                  ),
                  const SizedBox(height: 5),
                  BtnComplete(
                    updateTask: presenter!.onCompletedTask,
                  )
                ],
              )),
        );
      },
    );
  }
}
