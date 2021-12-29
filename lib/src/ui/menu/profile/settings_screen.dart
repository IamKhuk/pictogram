import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/widgets/custom_switch.dart';
import 'package:pictogram/src/widgets/heading_text.dart';
import 'package:pictogram/src/widgets/setting_container.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notification = false;
  bool privateAccount = false;

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
          'Settings',
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
        padding: EdgeInsets.all(24),
        children: [
          HeadingText(text: 'Account'),
          SizedBox(height: 24),
          SettingsContainer(text: 'Personal Information'),
          SizedBox(height: 20),
          SettingsContainer(text: 'Language'),
          SizedBox(height: 20),
          SettingsContainer(text: 'Liked Post'),
          SizedBox(height: 30),
          HeadingText(text: 'Preferences'),
          SizedBox(height: 24),
          Container(
            height: 56,
            padding: EdgeInsets.only(
              top: 16,
              bottom: 16,
              right: 16,
              left: 24,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppTheme.white.withOpacity(0.6),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 75,
                  spreadRadius: 0,
                  color: Color(0xFF939393).withOpacity(0.1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Notification',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: AppTheme.fontFamily,
                      height: 1.72,
                      color: AppTheme.dark,
                    ),
                  ),
                ),
                CustomSwitch(
                  value: notification,
                  onChanged: (_bool) {},
                  activeColor: AppTheme.blue,
                  inactiveColor: AppTheme.gray.withOpacity(0.4),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SettingsContainer(text: 'Actions'),
          SizedBox(height: 30),
          HeadingText(text: 'Security'),
          SizedBox(height: 24),
          Container(
            height: 56,
            padding: EdgeInsets.only(
              top: 16,
              bottom: 16,
              right: 16,
              left: 24,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.white.withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 75,
                    spreadRadius: 0,
                    color: Color(0xFF939393).withOpacity(0.1),
                  ),
                ]),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Private Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: AppTheme.fontFamily,
                      height: 1.72,
                      color: AppTheme.dark,
                    ),
                  ),
                ),
                CustomSwitch(
                  value: privateAccount,
                  onChanged: (_bool) {},
                  activeColor: AppTheme.blue,
                  inactiveColor: AppTheme.gray.withOpacity(0.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
