import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pictogram/src/dialog/bottom_dialog.dart';
import 'package:pictogram/src/model/post_model.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/ui/menu/home/home_screen.dart';
import 'package:pictogram/src/ui/menu/home/likes_screen.dart';

class PostContainer extends StatefulWidget {
  final PostModel post;

  PostContainer({required this.post});

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
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
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 75,
            spreadRadius: 0,
            color: Color(0xFF939393).withOpacity(0.1),
          ),
        ],
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
                  border: Border.all(color: AppTheme.blue),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(42),
                  child: Image.asset(widget.post.user.pfp),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  widget.post.user.name,
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
                  widget.post.comment,
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
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: false,
                  ),
                  items: widget.post.images.map(
                    (item) {
                      return Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width - 80,
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
                          widget.post.isLike = !widget.post.isLike;
                          widget.post.isLike == true
                              ? widget.post.likes.insert(
                                  0,
                                  me,
                                )
                              : widget.post.likes.removeAt(0);
                        });
                      },
                      child: SvgPicture.asset(
                        widget.post.isLike == false
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
                                users: widget.post.likes,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          widget.post.likes.length.toString(),
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
                child: GestureDetector(
                  onTap: () {
                    BottomDialog.showComments(
                      context,
                      widget.post.comments,
                      (_comment) {
                        setState(() {
                          widget.post.comments.insert(0, _comment);
                        });
                      },
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/comment.svg'),
                      SizedBox(width: 12),
                      Text(
                        widget.post.comments.length.toString(),
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
              ),
              Text(
                widget.post.time.hour.toString() + " hours ago",
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
  }
}
