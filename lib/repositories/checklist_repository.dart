import 'package:task_manager/models/checklist_item_model.dart';

class ChecklistRepository {
  List<ChecklistItem> getChecklist(int idTask) {
    List<ChecklistItem> allChecklist = [
      ChecklistItem(
        id: 1,
        idTask: 1,
        name: "Thiết kế màn hình trang chủ",
        completed: true,
      ),
      ChecklistItem(
        id: 1,
        idTask: 1,
        name: "Thiết kế màn hình chi tiết",
        completed: false,
      ),
      ChecklistItem(
        id: 1,
        idTask: 1,
        name: "Thiết kế màn hình thêm mới",
        completed: false,
      ),
    ];

    return allChecklist
        .where((checklist) => checklist.idTask == idTask)
        .toList();
  }
}
