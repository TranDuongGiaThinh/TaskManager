import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/repositories/task_repositoriy.dart';

class AddTaskState {
  final bool onTextField;
  final bool onAddDeadline;
  final bool onAddStartDate;
  final Task tempTask;

  AddTaskState({
    this.onTextField = false,
    this.onAddDeadline = false,
    this.onAddStartDate = false,
    required this.tempTask,
  });
}

abstract class AddTaskEvent {}

class AddNewTask extends AddTaskEvent {}

class UpdateState extends AddTaskEvent {
  final bool? onTextField;
  final bool? onAddDeadline;
  final bool? onAddStartDate;
  final Task? tempTask;

  UpdateState({
    this.onTextField,
    this.onAddDeadline,
    this.onAddStartDate,
    this.tempTask,
  });
}

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskState(tempTask: Task.empty())) {
    on<UpdateState>((event, emit) async {
      emit(
        AddTaskState(
          onTextField: event.onTextField ?? this.state.onTextField,
          onAddDeadline: event.onAddDeadline ?? this.state.onAddDeadline,
          onAddStartDate: event.onAddStartDate ?? this.state.onAddStartDate,
          tempTask: event.tempTask ?? this.state.tempTask,
        ),
      );
    });

    on<AddNewTask>((event, emit) async {
      await TaskRepository().addTask(this.state.tempTask);
    });
  }
}
