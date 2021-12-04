import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/ui/menu/mail/mail_screen.dart';
import 'package:pictogram/src/ui/menu/plus/plus_screen.dart';
import 'package:pictogram/src/ui/menu/profile/profile_screen.dart';
import 'package:pictogram/src/ui/menu/send/send_screen.dart';

import 'menu/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> data = [
    HomeScreen(),
    SendScreen(),
    PlusScreen(),
    MailScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg2,
      body: data[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppTheme.white, width: 8),
        ),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          elevation: 1,
          backgroundColor: AppTheme.blue,
          child: SvgPicture.asset(
            'assets/icons/plus.svg',
            color: AppTheme.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: AppTheme.white,
        selectedItemColor: AppTheme.black,
        unselectedItemColor: AppTheme.gray,
        elevation: 1,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/home.svg',
                  color: _selectedIndex == 0
                      ? AppTheme.black
                      : AppTheme.gray,
                ),
                SizedBox(height: 8),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: _selectedIndex == 0
                        ? AppTheme.blue
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/send.svg',
                  color: _selectedIndex == 1
                      ? AppTheme.black
                      : AppTheme.gray,
                ),
                SizedBox(height: 8),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: _selectedIndex == 1
                        ? AppTheme.blue
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
            label: 'Send',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 24,
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/mail.svg',
                  color: _selectedIndex == 3
                      ? AppTheme.black
                      : AppTheme.gray,
                ),
                SizedBox(height: 8),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: _selectedIndex == 3
                        ? AppTheme.blue
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
            label: 'Mail',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/user.svg',
                  color: _selectedIndex == 4
                      ? AppTheme.black
                      : AppTheme.gray,
                ),
                SizedBox(height: 8),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: _selectedIndex == 4
                        ? AppTheme.blue
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
