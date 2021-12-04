import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../main.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? offset;

  @override
  void initState() {
    _setLanguage();
    _nextScreen();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..forward();
    offset = Tween<Offset>(
      begin: Offset(0.0, 4.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.easeInOut,
      ),
    );
    // controller!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/back_img_02.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.bottomCenter,
            //     end: Alignment.topCenter,
            //     colors: [
            //       AppTheme.black,
            //       AppTheme.black,
            //       AppTheme.black,
            //       AppTheme.black,
            //       AppTheme.black.withOpacity(0.9),
            //       AppTheme.black.withOpacity(0.8),
            //       AppTheme.black.withOpacity(0.7),
            //       AppTheme.black.withOpacity(0.6),
            //       AppTheme.black.withOpacity(0.5),
            //       AppTheme.black.withOpacity(0.4),
            //       AppTheme.black.withOpacity(0.3),
            //       AppTheme.black.withOpacity(0.2),
            //       AppTheme.black.withOpacity(0.1),
            //       AppTheme.black.withOpacity(0.05),
            //       AppTheme.black.withOpacity(0.005),
            //     ],
            //   ),
            // ),
          ),
          Center(
            child: SlideTransition(
              position: offset!,
              child: SvgPicture.asset(
                "assets/icons/app_logo.svg",
                height: 150,
                width: 210,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _setLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var lan = prefs.getString('language') ?? "uz";
    var localizationDelegate = LocalizedApp.of(context).delegate;
    localizationDelegate.changeLocale(Locale(lan));
  }

  Future<void> _nextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("firstOpen") != null) {
      isLoginPage = true;
    } else {
      prefs.setString("firstOpen", "value");
      isLoginPage = false;
    }
    language = prefs.getString('language') ?? "uz";
    token = prefs.getString('token') ?? "";
    Timer(
      Duration(milliseconds: 1270),
          () {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return isLoginPage == false
        //           ? OnBoardScreen()
        //           : token == ""
        //           ? SignInScreen()
        //           : MainScreen();
        //     },
        //   ),
        // );
      },
    );
  }
}
