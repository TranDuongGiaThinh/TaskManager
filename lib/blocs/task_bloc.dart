import 'package:task_manager/blocs/add_task_bloc.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/presenters/user_presenter.dart';
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
  Function gotoHome;

  AddTask({required this.gotoHome});
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
  AddTaskBloc addTaskBloc;

  TaskBloc({required this.addTaskBloc})
      : super(const TaskState(allTasks: [], filteredTasks: [])) {
    on<LoadTasks>((event, emit) async {
      List<Task> tasks =
          await TaskRepository().getListTask(UserPresenter.user.id);
      emit(
        TaskState(allTasks: tasks, filteredTasks: tasks),
      );
    });

    on<AddTask>((event, emit) {
      addTaskBloc.add(AddNewTask());

      event.gotoHome();

      List<Task> tasks = TaskRepository().getListTask(UserPresenter.user.id);
      emit(
        TaskState(allTasks: tasks, filteredTasks: tasks),
      );
    });

    on<UpdateTask>((event, emit) async {
      TaskRepository().updateTask(event.task);

      add(LoadTasks(UserPresenter.user.id));
    });

    on<DeletedTask>((event, emit) async {
      TaskRepository().deleteTask(event.task.id);

      add(LoadTasks(UserPresenter.user.id));
    });

    on<FilterTasks>((event, emit) async {
      List<Task> filteredTasks =
          TaskRepository().filterTasks(state.allTasks, event.filterName);

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
