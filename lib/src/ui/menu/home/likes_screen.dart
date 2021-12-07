import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pictogram/src/model/user_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/widgets/user_likes_container.dart';

class LikesScreen extends StatefulWidget {
  final List<UserModel> users;

  LikesScreen({required this.users});

  @override
  _LikesScreenState createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
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
          'Likes',
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
        itemCount: widget.users.length,
        padding: EdgeInsets.symmetric(horizontal: 24),
        itemBuilder: (context, index) {
          return Column(
            children: [
              UserLikesContainer(data: widget.users[index]),
              index == widget.users.length - 1
                  ? SizedBox(height: 24)
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
