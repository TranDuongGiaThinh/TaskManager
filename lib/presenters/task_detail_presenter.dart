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
    taskBloc.taskDetailBloc = TaskDetailBloc(task: task);
  }

  onfocusTextField(bool isFocus) {
    taskBloc.taskDetailBloc!.add(focusTextField(isFocusTextField: isFocus));
  }

  onEdittingInfo(bool isEditting) {
    taskBloc.taskDetailBloc!.add(edittingInfo(isEdittingInfo: isEditting));
  }

  onEdittingChecklist(bool isEditting) {
    taskBloc.taskDetailBloc!
        .add(edittingChecklist(isEdittingChecklist: isEditting));
  }

  saveTaskName() {
    onfocusTextField(false);

    taskBloc.taskDetailBloc!.state.task.name =
        taskBloc.taskDetailBloc!.state.taskNameController.text;

    taskBloc.add(UpdateTask());
  }

  saveSartDate(DateTime dateTime) {
    taskBloc.taskDetailBloc!.state.task.startDate = dateTime;

    taskBloc.add(UpdateTask());
  }

  saveDeadline(DateTime dateTime) {
    taskBloc.taskDetailBloc!.state.task.deadline = dateTime;

    taskBloc.add(UpdateTask());
  }

  deletedTask() {
    taskBloc.add(DeleteTask(gotoHome: gotoHome));
  }

  onClickCheckBoxChecklistItem(ChecklistItem item) {
    //
  }

  updateChecklistItem(ChecklistItem item) {
    //
  }

  completedTask() {
    taskBloc.add(CompletedTask(gotoHome: gotoHome));
  }
}
