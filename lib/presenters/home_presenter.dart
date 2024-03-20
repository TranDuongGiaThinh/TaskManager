import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/presenters/user_presenter.dart';

class HomePresenter {
  final TaskBloc taskBloc;

  HomePresenter({required this.taskBloc});

  void loadTasks() {
    taskBloc.add(LoadTasks(UserPresenter.user.id));
  }

  void selectFilter(String filterName) {
    taskBloc.add(FilterTasks(filterName: filterName));
  }
}
