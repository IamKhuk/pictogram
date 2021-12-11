import 'package:pictogram/src/model/post_model.dart';
import 'package:pictogram/src/model/user_model.dart';

class Utils {
  static int numberFormat(List<PostModel> data){
    int k = 0;
    for(int i = 0; i<data.length; i++){
      k+=data[i].likes.length;
    }
    return k;
  }

  static List<UserModel> userListFormat(List<PostModel> data){
    List<UserModel> l = [];
    for(int i = 0; i<data.length; i++){
      for(int k = 0; k<data[i].likes.length; k++){
        l.add(data[i].likes[k]);
      }
    }
    return l;
  }
}