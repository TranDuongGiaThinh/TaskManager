import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/models/task_model.dart';

class TaskDetailPresenter{
  final TaskBloc taskBloc;

  TaskDetailPresenter({required this.taskBloc});

  void updateTask(Task task) {
    taskBloc.add(UpdateTask(task: task));
  }
  
  void deletedTask(Task task) {
    taskBloc.add(DeletedTask(task: task));
  }
  
  void completedTask(Task task) {
    //
  }
}