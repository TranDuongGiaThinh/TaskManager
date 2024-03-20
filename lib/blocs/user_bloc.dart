import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/models/user_model.dart';
import 'package:task_manager/repositories/user_repository.dart';

class UserState {
  UserModel user;

  UserState({required this.user});
}

class UserEvent {}

class LoadUser extends UserEvent {
  int idUser;
  LoadUser({required this.idUser});
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(user: UserModel.empty())) {
    on<LoadUser>((event, emit) async {
      UserModel user = await UserRepository().getUser(event.idUser);
      emit(UserState(user: user));
    });
  }
}
