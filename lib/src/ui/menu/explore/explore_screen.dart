import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/ui/menu/explore/posts_screen.dart';
import 'package:pictogram/src/ui/menu/home/home_screen.dart';

List<String> images = [
  'assets/images/post_07.png',
  'assets/images/post_08.png',
  'assets/images/post_09.png',
  'assets/images/post_10.png',
  'assets/images/post_11.png',
  'assets/images/post_12.png',
  'assets/images/post_13.png',
  'assets/images/post_14.png',
  'assets/images/post_15.png',
  'assets/images/post_16.png',
  'assets/images/post_17.png',
  'assets/images/post_18.png',
  'assets/images/post_19.png',
  'assets/images/post_20.png',
  'assets/images/post_07.png',
  'assets/images/post_08.png',
  'assets/images/post_09.png',
  'assets/images/post_10.png',
  'assets/images/post_11.png',
  'assets/images/post_12.png',
  'assets/images/post_13.png',
  'assets/images/post_14.png',
  'assets/images/post_15.png',
  'assets/images/post_16.png',
  'assets/images/post_17.png',
  'assets/images/post_18.png',
  'assets/images/post_19.png',
  'assets/images/post_20.png',
  'assets/images/post_16.png',
  'assets/images/post_13.png',
];

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg2,
      appBar: AppBar(
        title: Text(
          ' Explore',
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
          SvgPicture.asset('assets/icons/search.svg'),
          SizedBox(width: 24),
        ],
        elevation: 0,
        backgroundColor: AppTheme.bg1,
        brightness: Brightness.light,
      ),
      body: StaggeredGridView.countBuilder(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        itemCount: images.length,
        crossAxisCount: 3,
        itemBuilder: (context, index) {
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
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 75,
                    spreadRadius: 0,
                    color: Color(0xFF939393).withOpacity(0.1),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: images[index],
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.count(
          index % 7 == 0 ? 2 : 1,
          index % 7 == 0 ? 2 : 1,
        ),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }
}
