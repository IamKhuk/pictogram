import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/ui/main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();
  List<String> _images = [
    "assets/images/on_boarding_01.png",
    "assets/images/on_boarding_02.png",
    "assets/images/on_boarding_03.png",
  ];
  int _selectedIndex = 0;
  List<String> title = [
    'We Connect People',
    'Sharing Happiness',
    'Last Long Memories',
  ];
  List<String> msg = [
    'You can store memories of your photos in Zelio app without limit.',
    'Sharing happiness by sharing your memories in Zelio platform.',
    'You can store memories of your photos in Zelio app without limit.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Theme(
              data: ThemeData(
                platform: TargetPlatform.android,
              ),
              child: PageView.builder(
                itemCount: _images.length,
                controller: _pageController,
                onPageChanged: (_index) {
                  setState(() {
                    _selectedIndex = _index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: _selectedIndex == 0
                          ? BorderRadius.only(bottomLeft: Radius.circular(75))
                          : _selectedIndex == 1
                              ? BorderRadius.zero
                              : BorderRadius.only(
                                  bottomRight: Radius.circular(75)),
                    ),
                    child: ClipRRect(
                      borderRadius: _selectedIndex == 0
                          ? BorderRadius.only(bottomLeft: Radius.circular(75))
                          : _selectedIndex == 1
                              ? BorderRadius.zero
                              : BorderRadius.only(
                                  bottomRight: Radius.circular(75)),
                      child: Image.asset(
                        _images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title[_selectedIndex],
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.375,
                    color: AppTheme.dark,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 18),
                Text(
                  msg[_selectedIndex],
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.625,
                    color: AppTheme.dark.withOpacity(0.8),
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 60),
                Container(
                  height: 56,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 270),
                              height: 9,
                              width: _selectedIndex == 0 ? 28 : 9,
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(
                                color: _selectedIndex == 0
                                    ? AppTheme.blue
                                    : AppTheme.gray.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            SizedBox(width: 16),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 270),
                              height: 9,
                              width: _selectedIndex == 1 ? 28 : 9,
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(
                                color: _selectedIndex == 1
                                    ? AppTheme.blue
                                    : AppTheme.gray.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            SizedBox(width: 16),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 270),
                              height: 9,
                              width: _selectedIndex == 2 ? 28 : 9,
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(
                                color: _selectedIndex == 2
                                    ? AppTheme.blue
                                    : AppTheme.gray.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_selectedIndex < 2) {
                            _pageController.animateToPage(
                              _pageController.page!.toInt() + 1,
                              duration: Duration(milliseconds: 270),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MainScreen();
                                },
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(56),
                            color: AppTheme.blue,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                _selectedIndex == 0 || _selectedIndex == 1
                                    ? 55
                                    : 45,
                          ),
                          child: Center(
                            child: Text(
                              _selectedIndex == 0
                                  ? 'Next'
                                  : _selectedIndex == 1
                                      ? 'Next'
                                      : 'Get Started',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: AppTheme.fontFamily,
                                color: AppTheme.white,
                                height: 25 / 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
