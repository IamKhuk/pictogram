import 'package:pictogram/src/model/user_model.dart';

class CommentsModel {
  UserModel user;
  String comment;

  CommentsModel({
    required this.user,
    required this.comment,
  });
}
