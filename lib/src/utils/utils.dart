import 'package:pictogram/src/model/post_model.dart';

class Utils {
  static int numberFormat(List<PostModel> data){
    int k = 0;
    for(int i = 0; i<data.length; i++){
      k+=data[i].likes.length;
    }
    return k;
  }
}