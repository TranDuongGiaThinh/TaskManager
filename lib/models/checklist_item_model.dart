class ChecklistItem {
  int id;
  int idTask;
  String name;
  bool completed;

  ChecklistItem({
    required this.id,
    required this.idTask,
    required this.name,
    required this.completed,
  });
  ChecklistItem.empty({
    required this.idTask,
    this.id = 0,
    this.name = "Checklist Name",
    this.completed = false,
  });
}
