import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/models/task_model.dart';

class AddTaskPresenter{
  final TaskBloc taskBloc;

  AddTaskPresenter({required this.taskBloc});

  void addTask(Task task) {
    taskBloc.add(AddTask(task: task));
  }
}