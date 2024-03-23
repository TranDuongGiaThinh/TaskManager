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
    this.idUser = 1,
    this.name = "",
    this.progress = 0,
  });

  bool isDue() {
    if (deadline == null) return false;
    return deadline!.year == DateTime.now().year &&
        deadline!.month == DateTime.now().month &&
        deadline!.day == DateTime.now().day &&
        deadline!.isAfter(DateTime.now());
  }

  bool isInProgress() {
    return progress > 0 && progress < 100 && deadline!.isAfter(DateTime.now());
  }

  bool isExpired() {
    return deadline!.isBefore(DateTime.now()) && progress < 100;
  }

  bool isCompleted() {
    return progress == 100;
  }
}
