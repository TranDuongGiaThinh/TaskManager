import 'package:task_manager/models/checklist_item_model.dart';
import 'package:task_manager/repositories/task_repositoriy.dart';

class ChecklistRepository {
  static List<ChecklistItem> allChecklist = [
    ChecklistItem(
      id: 1,
      idTask: 1,
      name: "Thiết kế màn hình trang chủ",
      completed: true,
    ),
    ChecklistItem(
      id: 2,
      idTask: 1,
      name: "Thiết kế màn hình chi tiết",
      completed: true,
    ),
    ChecklistItem(
      id: 3,
      idTask: 1,
      name: "Thiết kế màn hình thêm mới",
      completed: true,
    ),
    ChecklistItem(
      id: 4,
      idTask: 2,
      name: "Thiết kế màn hình trang chủ",
      completed: true,
    ),
    ChecklistItem(
      id: 5,
      idTask: 2,
      name: "Thiết kế màn hình chi tiết",
      completed: false,
    ),
    ChecklistItem(
      id: 6,
      idTask: 2,
      name: "Thiết kế màn hình thêm mới",
      completed: false,
    ),
    ChecklistItem(
      id: 7,
      idTask: 3,
      name: "Xử lý màn hình trang chủ",
      completed: true,
    ),
    ChecklistItem(
      id: 8,
      idTask: 3,
      name: "Xử lý màn hình chi tiết",
      completed: true,
    ),
    ChecklistItem(
      id: 9,
      idTask: 3,
      name: "Xử lý màn hình thêm mới",
      completed: false,
    ),
    ChecklistItem(
      id: 10,
      idTask: 4,
      name: "Kết nối cơ sở dữ liệu",
      completed: false,
    ),
  ];

  List<ChecklistItem> getChecklist(int idTask) {
    return allChecklist
        .where((checklist) => checklist.idTask == idTask)
        .toList();
  }

  int calculateCompletionPercentage(int idTask) {
    List<ChecklistItem> checklistItems = getChecklist(idTask);

    int completedCount = checklistItems.where((item) => item.completed).length;

    int totalCount = checklistItems.length;

    double percentage = (completedCount / totalCount) * 100;

    return percentage.toInt();
  }

  int getMaxChecklistId() {
    if (allChecklist.isEmpty) return 0;

    int maxId = allChecklist.first.id;
    for (int i = 1; i < allChecklist.length; i++) {
      if (allChecklist[i].id > maxId) {
        maxId = allChecklist[i].id;
      }
    }
    return maxId;
  }

  void addChecklistItem(ChecklistItem item) {
    item.id = getMaxChecklistId() + 1;
    allChecklist.add(item);

    TaskRepository().updateTaskProgress(
      item.idTask,
      calculateCompletionPercentage(item.idTask),
    );
  }

  void updateChecklistItem(ChecklistItem item) {
    int index = allChecklist.indexWhere((checklist) => checklist.id == item.id);
    if (index != -1) {
      allChecklist[index] = item;
    }

    TaskRepository().updateTaskProgress(
      item.idTask,
      calculateCompletionPercentage(item.idTask),
    );
  }

  deleteChecklistItem(ChecklistItem item) {
    allChecklist.removeWhere((checklist) => checklist.id == item.id);

    TaskRepository().updateTaskProgress(
      item.idTask,
      calculateCompletionPercentage(item.idTask),
    );
  }
}
