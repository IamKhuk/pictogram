import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/ui/splash/onboarding_screen.dart';

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
    // _setLanguage();
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blue,
      body: Stack(
        children: [
          Column(
            children: [
              SvgPicture.asset('assets/icons/splash_up.svg'),
              Expanded(child: Container()),
              SvgPicture.asset('assets/icons/splash_down.svg'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/logo_white.svg'),
                ],
              ),
              Spacer(),
              Spacer(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LOADING',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: AppTheme.fontFamily,
                        letterSpacing: 0.14,
                        color: AppTheme.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Future<void> _setLanguage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var lan = prefs.getString('language') ?? "uz";
  //   var localizationDelegate = LocalizedApp.of(context).delegate;
  //   localizationDelegate.changeLocale(Locale(lan));
  // }

  _nextScreen(){
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (prefs.getString("firstOpen") != null) {
    //   isLoginPage = true;
    // } else {
    //   prefs.setString("firstOpen", "value");
    //   isLoginPage = false;
    // }
    // language = prefs.getString('language') ?? "uz";
    // token = prefs.getString('token') ?? "";
    Timer(
      Duration(milliseconds: 1270),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OnBoardingScreen();
            },
          ),
        );
      },
    );
  }
}
