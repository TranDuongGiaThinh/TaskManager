import 'package:task_manager/models/checklist_item_model.dart';

class ChecklistRepository {
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

  List<ChecklistItem> getChecklist(int idTask) {
    return allChecklist
        .where((checklist) => checklist.idTask == idTask)
        .toList();
  }

  void addChecklistItem(ChecklistItem item) {
    allChecklist.add(item);
  }

  void updateChecklistItem(ChecklistItem item) {
    int index = allChecklist.indexWhere((checklist) => checklist.id == item.id);
    if (index != -1) {
      allChecklist[index] = item;
    }
  }

  void deleteChecklistItem(id) {
    allChecklist.removeWhere((checklist) => checklist.id == id);
  }
}
