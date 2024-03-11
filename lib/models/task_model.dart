class Task {
  int id;
  String title;
  String description;
  bool isCompleted;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.isCompleted});
  Task.empty(
      {this.id = 0,
      this.title = "Taskname",
      this.description = "Task description",
      this.isCompleted = false});
}
