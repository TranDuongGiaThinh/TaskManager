import 'package:task_manager/blocs/add_task_bloc.dart';
import 'package:task_manager/blocs/task_detail_bloc.dart';
import 'package:task_manager/models/checklist_item_model.dart';
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

class EdittingInfo extends TaskEvent {
  final bool isEdittingInfo;

  EdittingInfo({required this.isEdittingInfo});
}

class EdittingChecklist extends TaskEvent {
  final bool isEdittingChecklist;

  EdittingChecklist({required this.isEdittingChecklist});
}

class UpdateTask extends TaskEvent {}

class UpdateChecklist extends TaskEvent {}

class DeleteTask extends TaskEvent {
  final Function gotoHome;

  DeleteTask({required this.gotoHome});
}

class DeleteChecklistItem extends TaskEvent {
  final ChecklistItem item;

  DeleteChecklistItem({required this.item});
}

class AddChecklistItem extends TaskEvent {
  final ChecklistItem item;

  AddChecklistItem({required this.item});
}

class CompletedTask extends TaskEvent {
  final Function gotoHome;

  CompletedTask({required this.gotoHome});
}

class FilterTasks extends TaskEvent {
  final String filterName;
  const FilterTasks({required this.filterName});
}

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  AddTaskBloc addTaskBloc;
  TaskDetailBloc? taskDetailBloc;

  TaskBloc({required this.addTaskBloc})
      : super(const TaskState(allTasks: [], filteredTasks: [])) {
    on<LoadTasks>((event, emit) {
      List<Task> tasks = TaskRepository().getListTask(UserPresenter.user.id);

      emit(
        TaskState(allTasks: tasks, filteredTasks: tasks),
      );
    });

    on<FilterTasks>((event, emit) {
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

    on<AddTask>((event, emit) {
      addTaskBloc.add(AddNewTask());

      event.gotoHome();

      LoadTasks(UserPresenter.user.id);
    });

    on<UpdateTask>((event, emit) {
      taskDetailBloc!.add(updateTask());

      LoadTasks(UserPresenter.user.id);
    });

    on<UpdateChecklist>((event, emit) {
      taskDetailBloc!.add(updateChecklistItem());

      LoadTasks(UserPresenter.user.id);
    });

    on<EdittingInfo>((event, emit) {
      taskDetailBloc!.add(edittingInfo(isEdittingInfo: event.isEdittingInfo));

      emit(state);
    });

    on<EdittingChecklist>((event, emit) {
      taskDetailBloc!.add(
          edittingChecklist(isEdittingChecklist: event.isEdittingChecklist));

      emit(state);
    });

    on<DeleteTask>((event, emit) {
      TaskRepository().deleteTask(taskDetailBloc!.state.task.id);

      event.gotoHome();

      LoadTasks(UserPresenter.user.id);
    });

    on<AddChecklistItem>((event, emit) {
      taskDetailBloc!.add(addChecklistItem(item: event.item));

      LoadTasks(UserPresenter.user.id);
    });

    on<DeleteChecklistItem>((event, emit) {
      taskDetailBloc!.add(deleteChecklistItem(item: event.item));

      LoadTasks(UserPresenter.user.id);
    });

    on<CompletedTask>((event, emit) {
      TaskRepository().completedTask(taskDetailBloc!.state.task.id);

      event.gotoHome();

      LoadTasks(UserPresenter.user.id);
    });
  }
}
