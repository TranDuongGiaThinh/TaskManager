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
  ChecklistItem? edittingChecklistItem;
  TextEditingController checklistItemController;

  TaskDetailState({
    required this.task,
    required this.checklist,
    required this.taskNameController,
    required this.checklistItemController,
    this.isEdittingInfo = false,
    this.isEdittingChecklist = false,
    this.isFocusTextField = false,
    this.edittingChecklistItem = null,
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

class edittingChecklistItem extends TaskDetailEvent {
  final ChecklistItem item;

  edittingChecklistItem({required this.item});
}

class updateTask extends TaskDetailEvent {}

class updateChecklist extends TaskDetailEvent {
  final List<ChecklistItem> checklist;

  updateChecklist({required this.checklist});
}

class deleteChecklistItem extends TaskDetailEvent {
  final ChecklistItem item;

  deleteChecklistItem({required this.item});
}

class addChecklistItem extends TaskDetailEvent {
  final ChecklistItem item;

  addChecklistItem({required this.item});
}

class updateChecklistItem extends TaskDetailEvent {}

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  TaskDetailBloc({required task})
      : super(TaskDetailState(
          task: task,
          checklist: ChecklistRepository().getChecklist(task.id),
          taskNameController: TextEditingController(text: task.name),
          checklistItemController: TextEditingController(),
        )) {
    on<focusTextField>((event, emit) {
      emit(
        TaskDetailState(
          task: state.task,
          checklist: state.checklist,
          isEdittingInfo: state.isEdittingInfo,
          isFocusTextField: event.isFocusTextField,
          taskNameController: state.taskNameController,
          checklistItemController: state.checklistItemController,
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
          checklistItemController: state.checklistItemController,
        ),
      );
    });
    on<updateTask>((event, emit) {
      TaskRepository().updateTask(state.task);

      Task updateTask = TaskRepository().getTask(state.task.id);

      emit(
        TaskDetailState(
          task: updateTask,
          checklist: ChecklistRepository().getChecklist(task.id),
          taskNameController: TextEditingController(text: updateTask.name),
          checklistItemController: state.checklistItemController,
          isEdittingInfo: state.isEdittingInfo,
        ),
      );
    });
    on<updateChecklist>((event, emit) {
      emit(
        TaskDetailState(
          task: state.task,
          checklist: event.checklist,
          isEdittingChecklist: state.isEdittingChecklist,
          taskNameController: state.taskNameController,
          checklistItemController: state.checklistItemController,
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
          checklistItemController: state.checklistItemController,
        ),
      );
    });
    on<edittingChecklistItem>((event, emit) {
      emit(
        TaskDetailState(
          task: state.task,
          checklist: state.checklist,
          isEdittingChecklist: state.isEdittingChecklist,
          taskNameController: state.taskNameController,
          checklistItemController: TextEditingController(text: event.item.name),
          isEdittingInfo: state.isEdittingInfo,
          isFocusTextField: state.isFocusTextField,
          edittingChecklistItem: event.item,
        ),
      );
    });
    on<updateChecklistItem>((event, emit) {
      ChecklistRepository().updateChecklistItem(state.edittingChecklistItem!);

      Task updateTask = TaskRepository().getTask(state.task.id);
      List<ChecklistItem> checklist =
          ChecklistRepository().getChecklist(task.id);

      emit(
        TaskDetailState(
          task: updateTask,
          checklist: checklist,
          taskNameController: state.taskNameController,
          checklistItemController: TextEditingController(),
          isEdittingInfo: state.isEdittingInfo,
          edittingChecklistItem: null,
          isEdittingChecklist: state.isEdittingChecklist,
        ),
      );
    });
    on<deleteChecklistItem>((event, emit) {
      ChecklistRepository().deleteChecklistItem(event.item);

      Task updateTask = TaskRepository().getTask(state.task.id);
      List<ChecklistItem> checklist =
          ChecklistRepository().getChecklist(task.id);

      emit(
        TaskDetailState(
          task: updateTask,
          checklist: checklist,
          taskNameController: state.taskNameController,
          checklistItemController: TextEditingController(),
          isEdittingInfo: state.isEdittingInfo,
          edittingChecklistItem: null,
          isEdittingChecklist: state.isEdittingChecklist,
        ),
      );
    });
    on<addChecklistItem>((event, emit) {
      ChecklistRepository().addChecklistItem(event.item);

      Task updateTask = TaskRepository().getTask(state.task.id);
      List<ChecklistItem> checklist =
          ChecklistRepository().getChecklist(task.id);

      emit(
        TaskDetailState(
          task: updateTask,
          checklist: checklist,
          taskNameController: state.taskNameController,
          checklistItemController: TextEditingController(),
          isEdittingInfo: state.isEdittingInfo,
          edittingChecklistItem: null,
          isEdittingChecklist: state.isEdittingChecklist,
        ),
      );
    });
  }
}
