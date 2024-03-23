import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/presenters/user_presenter.dart';
import 'package:task_manager/repositories/task_repositoriy.dart';

class AddTaskState {
  final bool onTextField;
  final TextEditingController taskNameController;
   DateTime deadline;
   DateTime startDate;

  AddTaskState({
    this.onTextField = false,
    required this.taskNameController,
    required this.deadline,
    required this.startDate,
  });
}

abstract class AddTaskEvent {}

class AddNewTask extends AddTaskEvent {}

class UpdateState extends AddTaskEvent {
  final bool? onTextField;
  TextEditingController? taskNameController;
  DateTime? deadline;
  DateTime? startDate;

  UpdateState({
    this.onTextField,
    this.taskNameController,
    this.deadline,
    this.startDate,
  });
}

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc()
      : super(
          AddTaskState(
            taskNameController: TextEditingController(),
            deadline: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 23, 59),
            startDate: DateTime.now(),
          ),
        ) {
    on<UpdateState>((event, emit) async {
      emit(
        AddTaskState(
          onTextField: event.onTextField ?? this.state.onTextField,
          taskNameController:
              event.taskNameController ?? this.state.taskNameController,
          deadline: event.deadline ?? this.state.deadline,
          startDate: event.startDate ?? this.state.startDate,
        ),
      );
    });

    on<AddNewTask>((event, emit) {
       TaskRepository().addTask(
        Task(
          id: -1,
          idUser: UserPresenter.user.id,
          name: this.state.taskNameController.text,
          progress: 0,
          deadline: this.state.deadline,
          startDate: this.state.startDate,
        ),
      );
      emit(
        AddTaskState(
          taskNameController: TextEditingController(),
          deadline: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 23, 59),
          startDate: DateTime.now(),
        ),
      );
    });
  }
}
