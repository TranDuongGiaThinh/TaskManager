import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/models/checklist_item_model.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/repositories/checklist_repository.dart';
import 'package:task_manager/repositories/task_repositoriy.dart';

class TaskDetailState {
  final Task task;
  final List<ChecklistItem> checklist;
  final bool isEdittingInfo;
  final bool isEdittingChecklist;
  final bool isFocusTextField;
  TextEditingController taskNameController;

  TaskDetailState({
    required this.task,
    required this.checklist,
    required this.taskNameController,
    this.isEdittingInfo = false,
    this.isEdittingChecklist = false,
    this.isFocusTextField = false,
  });
}

abstract class TaskDetailEvent {}

class focusTextField extends TaskDetailEvent {
  final bool isFocusTextField;

  focusTextField({required this.isFocusTextField});
}

class edittingInfo extends TaskDetailEvent {
  final bool isEdittingInfo;

  edittingInfo({required this.isEdittingInfo});
}

class edittingChecklist extends TaskDetailEvent {
  final bool isEdittingChecklist;

  edittingChecklist({required this.isEdittingChecklist});
}

class updateTask extends TaskDetailEvent {}

class updateChecklist extends TaskDetailEvent {
  final List<ChecklistItem> checklist;

  updateChecklist({required this.checklist});
}

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  TaskDetailBloc({required task})
      : super(TaskDetailState(
          task: task,
          checklist: ChecklistRepository().getChecklist(task.id),
          taskNameController: TextEditingController(text: task.name),
        )) {
    on<focusTextField>((event, emit) {
      emit(
        TaskDetailState(
          task: state.task,
          checklist: state.checklist,
          isEdittingInfo: state.isEdittingInfo,
          isFocusTextField: event.isFocusTextField,
          taskNameController: state.taskNameController,
        ),
      );
    });
    on<edittingInfo>((event, emit) {
      emit(
        TaskDetailState(
          task: state.task,
          checklist: state.checklist,
          isEdittingInfo: event.isEdittingInfo,
          isFocusTextField: event.isEdittingInfo,
          taskNameController: state.taskNameController,
        ),
      );
    });
    on<edittingChecklist>((event, emit) {
      emit(
        TaskDetailState(
          task: state.task,
          checklist: state.checklist,
          isEdittingChecklist: event.isEdittingChecklist,
          taskNameController: state.taskNameController,
        ),
      );
    });
    on<updateTask>((event, emit) {
      TaskRepository().updateTask(state.task);

      Task updateTask = TaskRepository().getTask(state.task.id);

      emit(TaskDetailState(
          task: updateTask,
          checklist: ChecklistRepository().getChecklist(task.id),
          taskNameController: TextEditingController(text: updateTask.name),
          isEdittingInfo: state.isEdittingInfo,
        ));
    });
    on<updateChecklist>((event, emit) {
      emit(
        TaskDetailState(
          task: state.task,
          checklist: event.checklist,
          isEdittingChecklist: state.isEdittingChecklist,
          taskNameController: state.taskNameController,
        ),
      );
    });
  }
}
