import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pictogram/src/theme/app_theme.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  PageController _pageController = PageController();
  List<String> data = [
    "assets/images/on_board_one.png",
    "assets/images/on_board_two.png",
    "assets/images/on_board_three.png",
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Stack(
        children: [
          Theme(
            data: ThemeData(
              platform: TargetPlatform.android,
            ),
            child: PageView.builder(
              itemCount: data.length,
              controller: _pageController,
              onPageChanged: (_index) {
                setState(() {
                  _selectedIndex = _index;
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        data[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/images/back_img_01.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 270),
                    height: 8,
                    width: _selectedIndex == 0 ? 28 : 8,
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color:
                      _selectedIndex == 0 ? AppTheme.green : AppTheme.gray,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(width: 4),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 270),
                    height: 8,
                    width: _selectedIndex == 1 ? 28 : 8,
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color:
                      _selectedIndex == 1 ? AppTheme.green : AppTheme.gray,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(width: 4),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 270),
                    height: 8,
                    width: _selectedIndex == 2 ? 28 : 8,
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color:
                      _selectedIndex == 2 ? AppTheme.green : AppTheme.gray,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    _selectedIndex == 0
                        ? translate("onboad.one_title")
                        : _selectedIndex == 1
                        ? translate("onboad.two_title")
                        : translate("onboad.three_title"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      height: 1.4,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    _selectedIndex == 0
                        ? translate("onboad.one_msg")
                        : _selectedIndex == 1
                        ? translate("onboad.two_msg")
                        : translate("onboad.three_msg"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.gray,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48),
              GestureDetector(
                onTap: () {
                  if (_selectedIndex < 2) {
                    _pageController.animateToPage(
                      _pageController.page!.toInt() + 1,
                      duration: Duration(milliseconds: 270),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return SignInScreen();
                    //     },
                    //   ),
                    // );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: Platform.isIOS ? 45 : 32,
                    left: 16,
                    right: 16,
                  ),
                  height: 56,
                  decoration: BoxDecoration(
                      color: AppTheme.green,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      translate("onboad.next"),
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.3,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
