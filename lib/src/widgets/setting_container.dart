import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pictogram/src/theme/app_theme.dart';

class SettingsContainer extends StatelessWidget {
  final String text;

  SettingsContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: AppTheme.fontFamily,
                height: 1.72,
                color: AppTheme.dark,
              ),
            ),
          ),
          SvgPicture.asset('assets/icons/right.svg'),
        ],
      ),
    );

  }
}
