import 'package:pictogram/src/model/comments_model.dart';
import 'package:pictogram/src/model/user_model.dart';

class PostModel {
  UserModel user;
  List<String> images;
  String comment;
  List<UserModel> likes;
  List<CommentsModel> comments;
  DateTime time;
  bool isLike;

  PostModel({
    required this.user,
    required this.images,
    required this.comment,
    required this.likes,
    required this.comments,
    required this.time,
    this.isLike = false,
  });
}
