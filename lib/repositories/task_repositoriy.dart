import 'package:task_manager/models/task_model.dart';

class TaskRepository {
  List<Task> getListTask(int idUser) {
    List<Task> tasks = [
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
        id: 3,
        idUser: 1,
        name: "Code giao diện",
        progress: 33,
        startDate: DateTime(2024, 03, 15, 9, 0),
        deadline: DateTime(2024, 03, 17, 23, 59),
      ),
      Task(
        id: 2,
        idUser: 1,
        name: "Xử lý sự kiện",
        progress: 10,
        startDate: DateTime(2024, 03, 15, 9, 0),
        deadline: DateTime(2024, 03, 20, 23, 59),
      ),
      Task(
        id: 2,
        idUser: 1,
        name: "Kết nối cơ sở dữ liệu",
        progress: 0,
        startDate: DateTime(2024, 03, 30, 9, 0),
        deadline: DateTime(2024, 04, 5, 23, 59),
      ),
    ];

    return tasks.where((checklist) => checklist.idUser == idUser).toList();
  }
}
