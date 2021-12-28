import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pictogram/src/model/notification_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/ui/menu/profile/user_profile_screen.dart';

class NotificationContainer extends StatelessWidget {
  final NotificationModel data;

  NotificationContainer({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return UserProfileScreen(
                      user: data.user,
                    );
                  },
                ),
              );
            },
            child: Container(
              height: 38,
              width: 38,
              margin: EdgeInsets.only(right: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                border: Border.all(color: AppTheme.blue),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(38),
                child: Image.asset(
                  data.user.pfp,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: RichText(
              overflow: TextOverflow.clip,
              text: TextSpan(
                text: data.user.name + '  ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: AppTheme.fontFamily,
                  height: 1.72,
                  color: AppTheme.dark,
                ),
                children: [
                  TextSpan(
                    text: data.id == 1
                        ? 'Liked your photo'
                        : data.id == 2
                            ? 'Commented in your post '
                            : data.id == 3 && data.content == 'post'
                                ? 'Tagged you in a post'
                                : 'Mentioned you in a comment ',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      fontFamily: AppTheme.fontFamily,
                      height: 1.72,
                      color: AppTheme.dark,
                    ),
                  ),
                  TextSpan(
                    text: data.id == 2
                        ? data.content
                        : data.id == 3 && data.content == 'comment'
                            ? data.mention
                            : '',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      fontFamily: AppTheme.fontFamily,
                      height: 1.72,
                      color: AppTheme.dark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12),
          Text(
            data.date.toString(),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              fontFamily: AppTheme.fontFamily,
              height: 1.72,
              color: AppTheme.gray,
            ),
          ),
        ],
      ),
    );
  }
}
