import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pictogram/src/defaults/users.dart';
import 'package:pictogram/src/model/notification_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';

class NotificationScreen extends StatefulWidget {

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> today =[
    NotificationModel(user: user_01, id: 1, date: DateTime.now()),
    NotificationModel(user: user_02, id: 1, date: DateTime.now()),
    NotificationModel(user: user_03, id: 2, content: 'Have a nice day :)', date: DateTime.now()),
    NotificationModel(user: user_04, id: 3, content: 'post', date: DateTime.now()),
  ];

  List<NotificationModel> thisWeek =[
    NotificationModel(user: user_01, id: 1, date: DateTime.now()),
    NotificationModel(user: user_02, id: 2, content: 'That\'s great', date: DateTime.now()),
    NotificationModel(user: user_02, id: 1, date: DateTime.now()),
    NotificationModel(user: user_02, id: 1, date: DateTime.now()),
    NotificationModel(user: user_04, id: 3, content: 'comment', date: DateTime.now()),
  ];

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
          'Notifications',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: AppTheme.fontFamily,
            color: AppTheme.dark,
            height: 1.357,
          ),
        ),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/more.svg'),
          ),
          SizedBox(width: 24),
        ],
        elevation: 0,
        backgroundColor: AppTheme.bg1,
        brightness: Brightness.light,
      ),
      body: ListView(

      ),
    );
  }
}
