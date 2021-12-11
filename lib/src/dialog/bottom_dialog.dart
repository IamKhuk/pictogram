import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pictogram/src/model/comments_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'dart:io';

import 'package:pictogram/src/ui/menu/home/home_screen.dart';

class BottomDialog {
  static void showComments(
    BuildContext context,
    List<CommentsModel> comments,
    Function(CommentsModel _comment) onTap,
  ) {
    TextEditingController _controller = new TextEditingController();
    bool onChanged = false;
    showModalBottomSheet(
      isScrollControlled: true,
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
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            color: AppTheme.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                ],
                              ),
                              SizedBox(height: 24),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 38,
                                            width: 38,
                                            margin: EdgeInsets.only(right: 16),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(38),
                                              border: Border.all(
                                                  color: AppTheme.blue),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(38),
                                              child: Image.asset(
                                                comments[index].user.pfp,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              overflow: TextOverflow.clip,
                                              text: TextSpan(
                                                text:
                                                    comments[index].user.name +
                                                        '  ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppTheme.fontFamily,
                                                  height: 1.72,
                                                  color: AppTheme.dark,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        comments[index].comment,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          AppTheme.fontFamily,
                                                      height: 1.72,
                                                      color: AppTheme.dark,
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                                  enabled: true,
                                  onChanged: (_text) {
                                    setState(() {
                                      onChanged = true;
                                      if (_controller.text == '') {
                                        onChanged = false;
                                      }
                                    });
                                  },
                                  controller: _controller,
                                  cursorColor: AppTheme.blue,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    height: 1.72,
                                    color: AppTheme.dark,
                                  ),
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontFamily: AppTheme.fontFamily,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      height: 1.72,
                                      color: AppTheme.dark.withOpacity(0.6),
                                    ),
                                    prefixIcon: Container(
                                      padding: EdgeInsets.only(
                                        top: 13,
                                        bottom: 13,
                                        left: 20,
                                        right: 13,
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/icons/smile.svg',
                                      ),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        if(_controller.text != ''){
                                          onTap(
                                            CommentsModel(
                                              user: me,
                                              comment: _controller.text,
                                            ),
                                          );
                                        }
                                        setState(() {
                                          _controller.text = '';
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          top: 13,
                                          bottom: 13,
                                          right: 20,
                                          left: 13,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/icons/send.svg',
                                          color: onChanged == false
                                              ? AppTheme.dark
                                              : AppTheme.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static void createUploadImageChat(
      BuildContext context,
      Function onGallery,
      Function onCamera,
      ) async {
    showModalBottomSheet(
      barrierColor: AppTheme.black.withOpacity(0.45),
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 212,
              margin: EdgeInsets.only(
                bottom: 32,
                left: 16,
                right: 16,
              ),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                            ),
                            color: AppTheme.white,
                          ),
                          child: Center(
                            child: Text(
                              'Upload Image from',
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.2,
                                color: AppTheme.gray,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: AppTheme.gray.withOpacity(0.1),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              onGallery();
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                              ),
                              child: Center(
                                child: Text(
                                  'Gallery',
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    height: 1.2,
                                    color: AppTheme.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: AppTheme.gray.withOpacity(0.1),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              onCamera();
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                color: AppTheme.white,
                              ),
                              child: Center(
                                child: Text(
                                  'Camera',
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    height: 1.2,
                                    color: AppTheme.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.white,
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            height: 1.2,
                            color: AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
