class Task {
  int id;
  int idUser;
  String name;
  int progress;
  DateTime? startDate;
  DateTime? deadline;
  DateTime? completionDate;

  Task({
    required this.id,
    required this.idUser,
    required this.name,
    required this.progress,
    this.startDate,
    this.deadline,
    this.completionDate,
  });
  Task.empty({
    this.id = 0,
    this.idUser = 0,
    this.name = "Taskname",
    this.progress = 0,
  });
}
