import 'package:task_manager/blocs/task_detail_bloc.dart';
import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/models/checklist_item_model.dart';
import 'package:task_manager/models/task_model.dart';

class TaskDetailPresenter {
  final TaskBloc taskBloc;
  final Function gotoHome;

  TaskDetailPresenter({
    required Task task,
    required this.taskBloc,
    required this.gotoHome,
  }) {
    taskBloc.taskDetaiBloc = TaskDetailBloc(task: task);
  }

  updateTaskInfo() {
    //
  }

  checkedChecklistItem(ChecklistItem item) {
    //
  }

  updateChecklistItem(ChecklistItem item) {
    //
  }

  deletedTask() {
    //
  }

  completedTask() {
    //
  }
}
