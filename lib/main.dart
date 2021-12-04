import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pictogram/src/ui/main_screen.dart';

String language = 'uz';
bool isLoginPage = false;
String token = "";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color(0xFF818C99),
        brightness: Brightness.light,
        canvasColor: Colors.transparent,
        platform: TargetPlatform.iOS,
      ),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      home: MainScreen(),
    );
  }
}
