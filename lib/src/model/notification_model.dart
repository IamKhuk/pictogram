import 'package:pictogram/src/model/user_model.dart';

class NotificationModel {
  UserModel user;
  int id;
  String content;
  DateTime date;
  String mention;

  NotificationModel({
    required this.user,
    required this.id,
    this.content = 'content',
    required this.date,
    this.mention = '',
  });
}

/// If id = 1, its like
/// If id = 2, its comment
/// If id = 3, its tag
