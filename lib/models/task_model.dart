class Task {
  int id;
  int idUser;
  String title;
  int progress;
  DateTime? startDate;
  DateTime? deadline;
  DateTime? completionDate;

  Task({
    required this.id,
    required this.idUser,
    required this.title,
    required this.progress,
    this.startDate,
    this.deadline,
    this.completionDate,
  });
  Task.empty({
    this.id = 0,
    this.idUser = 0,
    this.title = "Taskname",
    this.progress = 0,
  });
}
