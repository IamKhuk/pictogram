import 'package:flutter/cupertino.dart';
import 'package:pictogram/src/theme/app_theme.dart';

class HeadingText extends StatelessWidget {
  final String text;

  HeadingText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: AppTheme.fontFamily,
        height: 1.5,
        color: AppTheme.dark,
      ),
    );
  }
}
