import 'package:task_manager/models/user_model.dart';

class UserRepository {
  static List<UserModel> users = [
    UserModel(id: 1, name: "Trần Dương Gia Thịnh"),
    UserModel(id: 2, name: "Gia Thịnh"),
    UserModel(id: 3, name: "Trần Thịnh"),
  ];

  UserModel getUser(int idUser) {
    return users.where((user) => user.id == idUser).first;
  }
}
