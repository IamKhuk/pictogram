import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pictogram/src/model/chats_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';

class ChatScreen extends StatefulWidget {
  final ChatsModel data;

  ChatScreen({required this.data});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg2,
      body: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.all(24),
            color: AppTheme.bg1,
            child: Row(
              children: [
                GestureDetector(
                  child: SvgPicture.asset('assets/icons/arrow_left.svg'),
                ),
                SizedBox(width: 20),
                Container(
                  height: 52,
                  width: 52,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(52),
                    child: Image.asset(widget.data.user.pfp),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
            child: ListView.builder(
              itemCount: widget.data.msg.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container();
              },
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
