import 'package:task_manager/blocs/task_bloc.dart';

class HomePresenter {
  TaskBloc taskBloc;

  HomePresenter({required this.taskBloc});

  void loadTasks(int userId) {
    taskBloc.add(LoadTasks(userId));
  }
}