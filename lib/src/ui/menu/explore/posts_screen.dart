import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pictogram/src/model/post_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/widgets/post_container.dart';

class PostsScreen extends StatefulWidget {
  final List<PostModel> post;

  PostsScreen({required this.post});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg2,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 24),
            child: SvgPicture.asset('assets/icons/arrow_left.svg'),
          ),
        ),
        title: Text(
          'Explore',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: AppTheme.fontFamily,
            color: AppTheme.dark,
            height: 1.357,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppTheme.bg1,
        brightness: Brightness.light,
      ),
      body: ListView.builder(
        itemCount: widget.post.length,
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24,),
        itemBuilder: (context, index) {
          return PostContainer(post: widget.post[index]);
        },
      ),
    );
  }
}
