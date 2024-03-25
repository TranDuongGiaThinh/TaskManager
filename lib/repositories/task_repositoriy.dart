import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/utils/my_constants.dart';

class TaskRepository {
  static List<Task> tasks = [
    Task(
      id: 1,
      idUser: 1,
      name: "Thiết kế giao diện",
      progress: 100,
      startDate: DateTime(2024, 03, 15, 9, 0),
      deadline: DateTime(2024, 03, 17, 23, 59),
      completionDate: DateTime(2024, 03, 16, 10, 30),
    ),
    Task(
      id: 2,
      idUser: 1,
      name: "Code giao diện",
      progress: 33,
      startDate: DateTime(2024, 03, 15, 9, 0),
      deadline: DateTime(2024, 03, 17, 23, 59),
    ),
    Task(
      id: 3,
      idUser: 1,
      name: "Xử lý sự kiện",
      progress: 67,
      startDate: DateTime(2024, 03, 15, 9, 0),
      deadline: DateTime(2024, 03, 23, 23, 59),
    ),
    Task(
      id: 4,
      idUser: 1,
      name: "Kết nối cơ sở dữ liệu",
      progress: 0,
      startDate: DateTime(2024, 03, 30, 9, 0),
      deadline: DateTime(2024, 04, 5, 23, 59),
    ),
  ];

  Task getTask(int idTask) {
    return tasks.where((task) => task.id == idTask).first;
  }

  List<Task> getListTask(int idUser) {
    return tasks.where((task) => task.idUser == idUser).toList();
  }

  List<Task> filterTasks(List<Task> tasks, String filterName) {
    switch (filterName) {
      case MyConstants.due:
        return tasks.where((task) => task.isDue()).toList();
      case MyConstants.inProgress:
        return tasks.where((task) => task.isInProgress()).toList();
      case MyConstants.expired:
        return tasks.where((task) => task.isExpired()).toList();
      case MyConstants.completed:
        return tasks.where((task) => task.isCompleted()).toList();
      default:
        return tasks;
    }
  }

  int getMaxTaskId() {
    if (tasks.isEmpty) return 0;

    int maxId = tasks.first.id;
    for (int i = 1; i < tasks.length; i++) {
      if (tasks[i].id > maxId) {
        maxId = tasks[i].id;
      }
    }
    return maxId;
  }

  addTask(Task task) {
    task.id = getMaxTaskId() + 1;
    tasks.addAll([task]);
  }

  updateTask(Task newTask) {
    int index = tasks.indexWhere((task) => task.id == newTask.id);
    if (index != -1) {
      tasks[index] = newTask;
    }
  }

  deleteTask(int idTask) {
    tasks.removeWhere((task) => task.id == idTask);
  }
}
