import 'package:task_manager/blocs/task_bloc.dart';

class TaskPresenter {
  final TaskBloc taskBloc;

  TaskPresenter({required this.taskBloc});

  void loadTasks(int userId) {
    taskBloc.add(LoadTasks(userId));
  }
}