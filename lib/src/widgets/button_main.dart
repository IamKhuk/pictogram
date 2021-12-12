import 'package:flutter/cupertino.dart';
import 'package:pictogram/src/theme/app_theme.dart';

class ButtonMain extends StatelessWidget {
  final String text;

  ButtonMain({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(56),
        color: AppTheme.blue,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 75,
            spreadRadius: 0,
            color: Color(0xFF939393).withOpacity(0.07),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: AppTheme.fontFamily,
            height: 1.4,
            color: AppTheme.white,
          ),
        ),
      ),
    );
  }
}
