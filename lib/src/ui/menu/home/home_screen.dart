import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pictogram/src/model/comments_model.dart';
import 'package:pictogram/src/model/post_model.dart';
import 'package:pictogram/src/model/top_story_model.dart';
import 'package:pictogram/src/model/user_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/widgets/post_container.dart';

UserModel me = UserModel(
  pfp: 'assets/images/me.jpg',
  name: 'Khusan Khukumov',
);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLike = true;

  List<TopStoryModel> story = [
    TopStoryModel(
      img: 'assets/images/user_img_01.png',
      title: 'Clark Amon',
    ),
    TopStoryModel(
      img: 'assets/images/user_img_02.png',
      title: 'Sam Dima',
    ),
    TopStoryModel(
      img: 'assets/images/user_img_03.png',
      title: 'Lady June',
    ),
    TopStoryModel(
      img: 'assets/images/user_img_01.png',
      title: 'Clark Amon',
    ),
    TopStoryModel(
      img: 'assets/images/user_img_02.png',
      title: 'Sam Dima',
    ),
    TopStoryModel(
      img: 'assets/images/user_img_03.png',
      title: 'Lady June',
    ),
    TopStoryModel(
      img: 'assets/images/user_img_01.png',
      title: 'Clark Amon',
    ),
    TopStoryModel(
      img: 'assets/images/user_img_02.png',
      title: 'Sam Dima',
    ),
    TopStoryModel(
      img: 'assets/images/user_img_03.png',
      title: 'Lady June',
    ),
  ];

  List<PostModel> posts = [
    PostModel(
      pfp: 'assets/images/user_img_04.png',
      name: 'Sansa Indira',
      images: ['assets/images/post_02.jpg'],
      comment:
          'My last day for this year holiday! So excited to share my memories with you guys!',
      likes: [
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
        UserModel(pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
        UserModel(pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
        UserModel(pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
      ],
      comments: [
        CommentsModel(
          user: UserModel(
              pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
          comment:
              "Haha lol. That’s so easy to use and user friendly, go try again in a moment!",
        ),
        CommentsModel(
          user:
              UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
          comment:
              'Wow! that’s so frickin’ cool dude, where do you get that? Is it available in Supermarket?',
        ),
        CommentsModel(
          user: UserModel(
              pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
          comment:
              'Let me see if I do it for you, just wait a minute and I will come back to you if it’s done :)',
        ),
        CommentsModel(
          user: UserModel(
              pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
          comment:
              '@john_flicks Haha isn’t that funny to you? share it to your mother and tell me her reaction!',
        ),
      ],
      time: DateTime.now(),
      isLike: false,
    ),
    PostModel(
      pfp: 'assets/images/user_img_04.png',
      name: 'Sansa Indira',
      images: [
        'assets/images/post_03.png',
        'assets/images/post_04.jpg',
        'assets/images/post_05.jpg',
      ],
      comment: 'My last day for this year holiday! This was awesome :)',
      likes: [
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
        UserModel(pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
        UserModel(pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
        UserModel(pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
        UserModel(pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
      ],
      comments: [
        CommentsModel(
          user: UserModel(
              pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
          comment:
              "@dudewayne9 I will go there next week, is it worth it? maybe we can go there together haha.",
        ),
        CommentsModel(
          user:
              UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
          comment:
              '@john_flicks Haha isn’t that funny to you? share it to your mother and tell me her reaction!',
        ),
        CommentsModel(
          user: UserModel(
              pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
          comment:
              'Let me see if I do it for you, just wait a minute and I will come back to you if it’s done :)',
        ),
      ],
      time: DateTime.now(),
      isLike: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg2,
      appBar: AppBar(
        title: Text(
          ' Home',
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
          SvgPicture.asset('assets/icons/bell.svg'),
          SizedBox(width: 24),
        ],
        elevation: 0,
        backgroundColor: AppTheme.bg1,
        brightness: Brightness.light,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 116,
            child: ListView.builder(
              itemCount: story.length,
              padding: EdgeInsets.only(
                top: 24,
                left: 24,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 73,
                  margin: EdgeInsets.only(right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      index == 0
                          ? Container(
                              height: 57,
                              width: 57,
                              child: DottedBorder(
                                color: AppTheme.blue,
                                strokeWidth: 3,
                                radius: Radius.circular(9),
                                borderType: BorderType.RRect,
                                child: Container(
                                  height: 57,
                                  width: 57,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/icons/plus.svg',
                                      color: AppTheme.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 57,
                              width: 57,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppTheme.blue,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(9),
                                child: Image.asset(
                                  story[index].img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      SizedBox(height: 10),
                      Text(
                        index == 0 ? 'Add Story' : story[index].title,
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: AppTheme.fontFamily,
                          fontWeight: FontWeight.normal,
                          height: 1.8,
                          color: AppTheme.grayDark,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ListView.builder(
            itemCount: posts.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              top: 28,
              left: 24,
              right: 24,
            ),
            itemBuilder: (context, index) {
              return PostContainer(post: posts[index]);
            },
          ),
        ],
      ),
    );
  }
}
