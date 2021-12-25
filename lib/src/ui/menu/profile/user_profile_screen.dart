import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pictogram/src/model/user_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/ui/menu/explore/posts_screen.dart';
import 'package:pictogram/src/ui/menu/home/home_screen.dart';
import 'package:pictogram/src/utils/utils.dart';

class UserProfileScreen extends StatefulWidget {
  final UserModel user;

  UserProfileScreen({required this.user});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool onFollow = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.bg2,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 24),
            child: SvgPicture.asset('assets/icons/arrow_left.svg'),
          ),
        ),
        title: Text(
          'Profile',
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
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/more.svg'),
          ),
          SizedBox(width: 24),
        ],
        elevation: 0,
        backgroundColor: AppTheme.bg1,
        brightness: Brightness.light,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            height: 86,
            margin: EdgeInsets.symmetric(vertical: 32),
            child: Row(
              children: [
                Container(
                  height: 86,
                  width: 86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(86),
                    border: Border.all(color: AppTheme.blue),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(86),
                    child: Image.asset(
                      widget.user.pfp,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.user.name,
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.dark,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '@username',
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.dark.withOpacity(0.8),
                        ),
                      ),
                    ),
                    Text(
                      'Tashkent, Uzbekistan',
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppTheme.dark.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56),
                    color: AppTheme.white,
                    border: Border.all(color: AppTheme.blue, width: 2),
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
                    child: SvgPicture.asset(
                      'assets/icons/comment.svg',
                      color: AppTheme.dark,
                    ),
                  ),
                ),
                SizedBox(width: 24),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      onFollow = !onFollow;
                    });
                  },
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width - 164,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56),
                      border: Border.all(color: AppTheme.blue, width: 2),
                      color: onFollow == false ? AppTheme.blue : AppTheme.white,
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
                        onFollow == false ? 'Follow' : 'Following',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: AppTheme.fontFamily,
                          color: onFollow == false
                              ? AppTheme.white
                              : AppTheme.dark,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 93,
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 18,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppTheme.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 75,
                  spreadRadius: 0,
                  color: Color(0xFF939393).withOpacity(0.07),
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      Utils.numberFormat(posts).toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: AppTheme.fontFamily,
                        color: AppTheme.dark,
                        height: 1.65,
                      ),
                    ),
                    Text(
                      'Likes',
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppTheme.dark.withOpacity(0.8),
                        height: 1.71,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '150 k',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: AppTheme.fontFamily,
                        color: AppTheme.dark,
                        height: 1.65,
                      ),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppTheme.dark.withOpacity(0.8),
                        height: 1.71,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: AppTheme.fontFamily,
                        color: AppTheme.dark,
                        height: 1.65,
                      ),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppTheme.dark.withOpacity(0.8),
                        height: 1.71,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 30),
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(
                posts.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PostsScreen(post: posts);
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 75,
                            spreadRadius: 0,
                            color: Color(0xFF939393).withOpacity(0.07),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          posts[index].images[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
