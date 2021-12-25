import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pictogram/src/model/chats_model.dart';
import 'package:pictogram/src/model/msg_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/ui/menu/profile/user_profile_screen.dart';

class ChatScreen extends StatefulWidget {
  final ChatsModel data;

  ChatScreen({required this.data});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<MsgModel> chats;
  bool onChanged = false;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    chats = widget.data.msg;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg2,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          setState(() {
            onChanged = false;
          });
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * ((122) / 812),
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              color: AppTheme.bg1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(44),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/arrow_left.svg',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return UserProfileScreen(
                                    user: widget.data.user);
                              },

                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(52),
                                border: Border.all(color: AppTheme.blue),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(52),
                                child: Image.asset(widget.data.user.pfp),
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  widget.data.user.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: AppTheme.fontFamily,
                                    height: 1.68,
                                    color: AppTheme.dark,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "@username",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    fontFamily: AppTheme.fontFamily,
                                    height: 1.72,
                                    color: AppTheme.dark.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                dragStartBehavior: DragStartBehavior.down,
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.zero,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemBuilder: (BuildContext context, int index) {
                  return chats[index].id == 1
                      ? Column(
                          children: [
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(width: 24),
                                Text(
                                  DateTime.now().hour.toString() +
                                      ':' +
                                      DateTime.now().minute.toString(),
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppTheme.gray,
                                  ),
                                ),
                                SizedBox(width: 24),
                                IntrinsicWidth(
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width -
                                                109),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                      ),
                                      color: AppTheme.blue,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 7),
                                          blurRadius: 45,
                                          spreadRadius: 0,
                                          color: Color(0xFF878787)
                                              .withOpacity(0.1),
                                        )
                                      ],
                                    ),
                                    child: SizedBox(
                                      child: Text(
                                        chats[index].msg,
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontFamily,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 24),
                              ],
                            ),
                            index == chats.length - 1
                                ? SizedBox(height: 16)
                                : Container(),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(height: 16),
                            Row(
                              children: [
                                SizedBox(width: 24),
                                IntrinsicWidth(
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width -
                                                109),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                      ),
                                      color: AppTheme.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 7),
                                          blurRadius: 45,
                                          spreadRadius: 0,
                                          color: Color(0xFF878787)
                                              .withOpacity(0.1),
                                        )
                                      ],
                                    ),
                                    child: Text(
                                      chats[index].msg,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontFamily,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.dark,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 24),
                                Text(
                                  DateTime.now().hour.toString() +
                                      ':' +
                                      DateTime.now().minute.toString(),
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppTheme.gray,
                                  ),
                                ),
                                SizedBox(width: 24),
                              ],
                            ),
                            index == chats.length - 1
                                ? SizedBox(height: 16)
                                : Container(),
                          ],
                        );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 24,
                right: 24,
                bottom: 44,
              ),
              color: AppTheme.bg1,
              child: Container(
                height: 52,
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
                        if (_controller.text != '') {
                          chats.add(MsgModel(msg: _controller.text, id: 1));
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
            ),
          ],
        ),
      ),
    );
  }
}
