import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pictogram/src/model/user_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';

class UserLikesContainer extends StatelessWidget {
  final UserModel data;

  UserLikesContainer({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16,),
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF939393).withOpacity(0.9),
            offset: Offset(0,10),
            blurRadius: 75,
            spreadRadius: 0,
          ),
        ],
        color: AppTheme.white.withOpacity(0.6),
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              border: Border.all(color: AppTheme.blue),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(44),
              child: Image.asset(
                data.pfp,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            data.name,
            style: TextStyle(
              fontFamily: AppTheme.fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppTheme.dark,
            ),
          ),
        ],
      ),
    );
  }
}
