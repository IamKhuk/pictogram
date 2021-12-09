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
  TextEditingController _controller = new TextEditingController();
  bool onSearch = false;
  bool onChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg2,
      body: GestureDetector(
        onTap: (){
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          setState(() {
            onSearch = false;
          });
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * ((90) / 812),
              color: AppTheme.bg1,
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              child: onSearch == false
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            ' Explore',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fontFamily,
                              color: AppTheme.dark,
                              height: 1.357,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              onSearch = true;
                            });
                          },
                          child: Container(
                            height: 38,
                            child: Center(
                              child: SvgPicture.asset('assets/icons/search.svg'),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      padding: EdgeInsets.only(top: 16),
                      child: TextField(
                        onChanged: (_text) {
                          setState(() {
                            onChanged = true;
                          });
                        },
                        controller: _controller,
                        autofocus: false,
                        cursorColor: AppTheme.blue,
                        decoration: InputDecoration(
                          prefixIcon: onChanged == false
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      onSearch = false;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      right: 16,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/search.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _controller.text = '';
                                      if (_controller.text == '') {
                                        onChanged = false;
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      right: 16,
                                    ),
                                    child: SvgPicture.asset('assets/icons/x.svg'),
                                  ),
                                ),
                        ),
                      ),
                    ),
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
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
            ),
          ],
        ),
      ),
    );
  }
}
