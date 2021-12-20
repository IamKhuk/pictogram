import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:pictogram/src/defaults/users.dart';
import 'package:pictogram/src/dialog/bottom_dialog.dart';
import 'package:pictogram/src/model/chats_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';

class MailScreen extends StatefulWidget {
  @override
  _MailScreenState createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  List<ChatsModel> chats = [
    ChatsModel(user: user_01, msg: ['Hey buddy', 'Howya doin?'], isRead: true),
    ChatsModel(
        user: user_02, msg: ['Hi There', 'Where are you?'], isRead: true),
    ChatsModel(user: user_03, msg: ['Hey babe'], isRead: true),
    ChatsModel(user: user_04, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_05, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_06, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_07, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_08, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_09, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_10, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_11, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_12, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_13, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_14, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_15, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_16, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_17, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_18, msg: ['Hey buddy', 'Howya doin?']),
    ChatsModel(user: user_19, msg: ['Hey buddy', 'Howya doin?']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Chats',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: AppTheme.fontFamily,
            color: AppTheme.dark,
            height: 1.357,
          ),
        ),
        centerTitle: false,
        actions: [
          SvgPicture.asset('assets/icons/more.svg'),
          SizedBox(width: 24),
        ],
        elevation: 0,
        backgroundColor: AppTheme.bg1,
        brightness: Brightness.light,
      ),
      body: ListView.builder(
        itemCount: chats.length,
        padding: EdgeInsets.only(top: 18),
        itemBuilder: (context, index) {
          return SwipeActionCell(
            key: ObjectKey(chats[index]),
            index: index,
            backgroundColor: AppTheme.bg2,
            trailingActions: [
              SwipeAction(
                content: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SvgPicture.asset(
                    'assets/icons/trash.svg',
                    color: AppTheme.red,
                  ),
                ),
                widthSpace: 100,
                onTap: (CompletionHandler handler) async {
                  BottomDialog.showDeleteChat(
                    context,
                    (delete) {
                      setState(() {
                        chats[index].deleted = delete;
                        if (chats[index].deleted == true) {
                          chats.removeAt(index);
                        }
                      });
                    },
                  );
                  await handler(false);
                  setState(() {});
                },
                color: AppTheme.bg2,
              ),
            ],
            closeWhenScrolling: true,
            deleteAnimationDuration: 270,
            isDraggable: true,
            // leadingActions: [
            //   SwipeAction(
            //     content: Padding(
            //       padding: const EdgeInsets.only(bottom: 16),
            //       child: SvgPicture.asset(
            //         'assets/icons/comment.svg',
            //         color: AppTheme.dark,
            //       ),
            //     ),
            //     color: AppTheme.bg2,
            //     onTap: (CompletionHandler handler) async {
            //       await handler(true);
            //       chats.removeAt(index);
            //       setState(() {});
            //     },
            //   ),
            // ],
            child: Container(
              height: 68,
              padding: EdgeInsets.only(
                top: 8,
                bottom: 8,
                left: 24,
                right: 24,
              ),
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.blue),
                      borderRadius: BorderRadius.circular(52),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(52),
                      child: Image.asset(
                        chats[index].user.pfp,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chats[index].user.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.64,
                            color: AppTheme.dark,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2),
                        Text(
                          chats[index].msg.last,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.72,
                            color: AppTheme.dark.withOpacity(0.8),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  chats[index].isRead == true
                      ? Container(
                          width: 52,
                          child: Center(
                            child: Container(
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.blue,
                              ),
                              child: Center(
                                child: Text(
                                  chats[index].msg.length.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    fontFamily: AppTheme.fontFamily,
                                    color: AppTheme.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
