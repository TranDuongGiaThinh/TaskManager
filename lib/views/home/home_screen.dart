import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/presenters/user_presenter.dart';
import 'package:task_manager/views/home/custom_appbar.dart';
import 'package:task_manager/views/home/dashboard.dart';
import 'package:task_manager/views/home/info_user.dart';
import 'package:task_manager/views/home/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    UserPresenter(1);

    TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(LoadTasks(UserPresenter.user.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      return Scaffold(
        body: ListView(children: const [
          CustomAppbar(),
          InfoUser(),
          DashBoard(),
          TaskList(),
        ]),
      );
    });
  }
}
