import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pictogram/src/defaults/users.dart';
import 'package:pictogram/src/model/notification_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/widgets/notification_container.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> today = [
    NotificationModel(user: user_01, id: 1, date: DateTime.now()),
    NotificationModel(user: user_02, id: 1, date: DateTime.now()),
    NotificationModel(
      user: user_03,
      id: 2,
      content: 'Have a nice day :)',
      date: DateTime.now(),
    ),
    NotificationModel(
      user: user_04,
      id: 3,
      content: 'post',
      date: DateTime.now(),
    ),
  ];

  List<NotificationModel> thisWeek = [
    NotificationModel(user: user_01, id: 1, date: DateTime.now()),
    NotificationModel(
      user: user_02,
      id: 2,
      content: 'That\'s great',
      date: DateTime.now(),
    ),
    NotificationModel(user: user_02, id: 1, date: DateTime.now()),
    NotificationModel(user: user_02, id: 1, date: DateTime.now()),
    NotificationModel(
      user: user_04,
      id: 3,
      content: 'comment',
      date: DateTime.now(),
      mention: 'Check it out dude',
    ),
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
      body: today.length > 0 || thisWeek.length > 0
          ? ListView(
              padding: EdgeInsets.all(24),
              children: [
                today.length > 0
                    ? Text(
                        'Today',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.5,
                          color: AppTheme.dark,
                        ),
                      )
                    : Container(),
                today.length > 0
                    ? ListView.builder(
                        itemCount: today.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return NotificationContainer(data: today[index]);
                        },
                      )
                    : Container(),
                today.length > 0 ? SizedBox(height: 30) : Container(),
                thisWeek.length > 0
                    ? Text(
                        'This Week',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.5,
                          color: AppTheme.dark,
                        ),
                      )
                    : Container(),
                thisWeek.length > 0
                    ? ListView.builder(
                        itemCount: thisWeek.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return NotificationContainer(data: thisWeek[index]);
                        },
                      )
                    : Container(),
              ],
            )
          : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/failed.svg',
                color: AppTheme.dark,
              ),
              SizedBox(height: 35),
              Text(
                'Notification Empty',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: AppTheme.fontFamily,
                  height: 1.4,
                  color: AppTheme.dark,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 24),
                  Expanded(
                    child: Text(
                      'There are no notifications in this account, let’s discover and take a look this later.',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        fontFamily: AppTheme.fontFamily,
                        height: 1.72,
                        color: AppTheme.dark.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ],
          ),
    );
  }
}
