import 'package:pictogram/src/model/user_model.dart';

class PostModel {
  String pfp;
  String name;
  List<String> images;
  String comment;
  List<UserModel> likes;
  List<UserModel> comments;
  DateTime time;
  bool isLike;

  PostModel({
    required this.pfp,
    required this.name,
    required this.images,
    required this.comment,
    required this.likes,
    required this.comments,
    required this.time,
    this.isLike = false,
  });
}
