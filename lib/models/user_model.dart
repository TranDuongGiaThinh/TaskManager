import 'dart:typed_data';

class UserModel {
  int id;
  String name;
  Uint8List? avatar;

  UserModel({required this.id, required this.name, this.avatar});
  UserModel.empty({this.id = -1, this.name = "Tên Người Dùng"});
}
