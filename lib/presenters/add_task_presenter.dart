import 'package:task_manager/blocs/add_task_bloc.dart';
import 'package:task_manager/blocs/task_bloc.dart';

class AddTaskPresenter {
  final TaskBloc taskBloc;
  Function gotoHome;

  AddTaskPresenter({required this.taskBloc, required this.gotoHome}) {
    taskBloc.addTaskBloc = AddTaskBloc();
  }

  void onClickBackButton(){
    gotoHome();

    taskBloc.addTaskBloc = AddTaskBloc();
  }

  void addTask() {
    taskBloc.add(AddTask(gotoHome: gotoHome));
  }

  void onTextField() {
    taskBloc.addTaskBloc.add(UpdateState(onTextField: true));
  }
}
