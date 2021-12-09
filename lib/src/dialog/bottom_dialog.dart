import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pictogram/src/model/comments_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'dart:io';

class BottomDialog {
  static void showComments(
    BuildContext context,
    List<CommentsModel> comments,
  ) {
    TextEditingController _controller = new TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: AppTheme.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 5,
                      width: 110,
                      margin: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppTheme.gray.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Comments',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: AppTheme.fontFamily,
                        height: 1.65,
                        color: AppTheme.dark,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Row(
                              children: [
                                Container(
                                  height: 38,
                                  width: 38,
                                  margin: EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(38),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(38),
                                    child: Image.asset(
                                      comments[index].user.pfp,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: comments[index].user.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: AppTheme.fontFamily,
                                      height: 1.72,
                                      color: AppTheme.dark,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: comments[index].comment,
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
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 52,
                      margin: EdgeInsets.only(
                        top: 8,
                        bottom: Platform.isIOS ? 24 : 32,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.gray.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(52),
                      ),
                      child: TextField(
                        controller: _controller,

                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
