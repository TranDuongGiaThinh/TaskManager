import 'package:task_manager/models/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/repositories/task_repositoriy.dart';
import 'package:task_manager/utils/my_constants.dart';

class TaskState {
  final List<Task> allTasks;
  final List<Task> filteredTasks;
  final String selectedFilter;

  const TaskState({
    required this.allTasks,
    required this.filteredTasks,
    this.selectedFilter = MyConstants.all,
  });
}

abstract class TaskEvent {
  const TaskEvent();
}

class LoadTasks extends TaskEvent {
  final int userId;

  LoadTasks(this.userId);
}

class AddTask extends TaskEvent {
  final Task task;
  const AddTask({required this.task});
}

class UpdateTask extends TaskEvent {
  final Task task;
  const UpdateTask({required this.task});
}

class DeletedTask extends TaskEvent {
  final Task task;
  const DeletedTask({required this.task});
}

class FilterTasks extends TaskEvent {
  final String filterName;
  const FilterTasks({required this.filterName});
}

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState(allTasks: [], filteredTasks: [])) {
    on<LoadTasks>((event, emit) async {
      List<Task> tasks = await TaskRepository().getListTask(1);
      emit(
        TaskState(allTasks: tasks, filteredTasks: tasks),
      );
    });
    on<AddTask>((event, emit) async {
      final state = this.state;
      List<Task> tasks = await List.from(state.allTasks)
        ..add(event.task);
      emit(
        TaskState(
          allTasks: tasks,
          filteredTasks: tasks,
        ),
      );
    });
    on<UpdateTask>((event, emit) async {
      //
    });
    on<DeletedTask>((event, emit) async {
      //
    });
    on<FilterTasks>((event, emit) async {
      final state = this.state;
      List<Task> filteredTasks;
      switch (event.filterName) {
        case MyConstants.due:
          filteredTasks = state.allTasks.where((task) => task.isDue()).toList();
          break;
        case MyConstants.inProgress:
          filteredTasks =
              state.allTasks.where((task) => task.isInProgress()).toList();
          break;
        case MyConstants.expired:
          filteredTasks =
              state.allTasks.where((task) => task.isExpired()).toList();
          break;
        case MyConstants.completed:
          filteredTasks =
              state.allTasks.where((task) => task.isCompleted()).toList();
          break;
        default:
          filteredTasks = state.allTasks;
      }
      emit(
        TaskState(
          allTasks: state.allTasks,
          filteredTasks: filteredTasks,
          selectedFilter: event.filterName,
        ),
      );
    });
  }
}
