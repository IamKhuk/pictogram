import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pictogram/src/model/post_model.dart';
import 'package:pictogram/src/model/top_story_model.dart';
import 'package:pictogram/src/model/user_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/ui/menu/home/likes_screen.dart';

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
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
        UserModel(pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
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
        UserModel(pfp: 'assets/images/user_img_01.png', name: 'Clark Amon'),
        UserModel(pfp: 'assets/images/user_img_02.png', name: 'Sam Dima'),
        UserModel(pfp: 'assets/images/user_img_03.png', name: 'Lady June'),
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
              return Container(
                width: MediaQuery.of(context).size.width - 48,
                margin: EdgeInsets.only(bottom: 24),
                padding: EdgeInsets.only(
                  top: 16,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 16),
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(42),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(42),
                            child: Image.asset(posts[index].pfp),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            posts[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 16,
                              color: AppTheme.dark,
                            ),
                          ),
                        ),
                        SvgPicture.asset('assets/icons/more.svg'),
                        SizedBox(width: 16),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      color: AppTheme.gray.withOpacity(0.2),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            posts[index].comment,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.normal,
                              color: AppTheme.dark.withOpacity(0.8),
                              height: 1.71,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                    SizedBox(height: 20),
                    Stack(
                      children: [
                        Container(
                          height: 170,
                          padding: EdgeInsets.only(left: 16),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: false,
                              viewportFraction: 1,
                              scrollDirection: Axis.horizontal,
                              enableInfiniteScroll: false,
                            ),
                            items: posts[index].images.map(
                              (item) {
                                return Container(
                                  height: 170,
                                  width: MediaQuery.of(context).size.width - 80,
                                  margin: EdgeInsets.only(right: 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      item,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 16),
                        Expanded(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    posts[index].isLike = !posts[index].isLike;
                                    posts[index].isLike == true
                                        ? posts[index].likes.add(
                                              UserModel(
                                                pfp: 'assets/images/me.jpg',
                                                name: 'Khusan Khukumov',
                                              ),
                                            )
                                        : posts[index].likes.removeLast();
                                  });
                                },
                                child: SvgPicture.asset(
                                  posts[index].isLike == false
                                      ? 'assets/icons/heart_i.svg'
                                      : 'assets/icons/heart_a.svg',
                                ),
                              ),
                              SizedBox(width: 12),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return LikesScreen(
                                            users: posts[index].likes);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    posts[index].likes.length.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppTheme.fontFamily,
                                      fontSize: 14,
                                      height: 1.71,
                                      color: AppTheme.dark.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/comment.svg'),
                              SizedBox(width: 12),
                              Text(
                                posts[index].comments.length.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppTheme.fontFamily,
                                  fontSize: 14,
                                  height: 1.71,
                                  color: AppTheme.dark.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          posts[index].time.hour.toString() + " hours ago",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            height: 1.71,
                            color: AppTheme.gray,
                          ),
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
