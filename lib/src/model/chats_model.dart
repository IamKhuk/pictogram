import 'package:pictogram/src/model/user_model.dart';

class ChatsModel {
  UserModel user;
  List<String> msg;
  bool isRead;

  ChatsModel({
    required this.user,
    required this.msg,
    this.isRead = false,
  });
}
