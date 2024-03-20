import 'package:task_manager/models/user_model.dart';

class UserRepository{
  UserModel getUser(int idUser){
    List<UserModel> users = [
      UserModel(id: 1, name: "Trần Dương Gia Thịnh"),
      UserModel(id: 2, name: "Gia Thịnh"),
      UserModel(id: 3, name: "Trần Thịnh"),
    ];

    return users.where((user) => user.id == idUser).first;
  }
}