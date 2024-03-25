import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/models/checklist_item_model.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/repositories/checklist_repository.dart';

class TaskDetailState {
  final Task task;
  final List<ChecklistItem> checklist;

  const TaskDetailState({required this.task, required this.checklist});
}

abstract class TaskDetailEvent {}

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  Task task;
  TaskDetailBloc({required this.task})
      : super(TaskDetailState(
            task: task,
            checklist: ChecklistRepository().getChecklist(task.id))) {
    //
  }
}
