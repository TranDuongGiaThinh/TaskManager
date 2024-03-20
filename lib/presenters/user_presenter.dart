import 'package:task_manager/models/user_model.dart';
import 'package:task_manager/repositories/user_repository.dart';

class UserPresenter {
  static UserModel user = UserModel.empty();

  UserPresenter(int idUser) {
    user = UserRepository().getUser(idUser);
  }
}
