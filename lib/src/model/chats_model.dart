import 'package:pictogram/src/model/msg_model.dart';
import 'package:pictogram/src/model/user_model.dart';

class ChatsModel {
  UserModel user;
  List<MsgModel> msg;
  bool isRead;
  bool deleted;

  ChatsModel({
    required this.user,
    required this.msg,
    this.isRead = false,
    this.deleted = false,
  });
}
