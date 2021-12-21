import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pictogram/src/theme/app_theme.dart';
import 'package:pictogram/src/widgets/button_main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userController = new TextEditingController();
  TextEditingController _pswController = new TextEditingController();

  bool _isObscure = false;

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
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/logo_blue.svg'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.65,
                            color: AppTheme.dark,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 26),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.65,
                            color: AppTheme.gray,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Username or email',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: AppTheme.fontFamily,
                height: 1.69,
                color: AppTheme.dark,
              ),
            ),
            Container(
              height: 56,
              margin: EdgeInsets.only(top: 16, bottom: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56),
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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 2,
                ),
                child: TextField(
                  controller: _userController,
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.5625,
                    color: AppTheme.dark,
                  ),
                  autofocus: false,
                  cursorColor: AppTheme.blue,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your username or email',
                    hintStyle: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      height: 1.72,
                      color: AppTheme.gray.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Password',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: AppTheme.fontFamily,
                height: 1.69,
                color: AppTheme.dark,
              ),
            ),
            Container(
              height: 56,
              margin: EdgeInsets.only(top: 16, bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56),
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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 2,
                ),
                child: TextField(
                  controller: _pswController,
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.5625,
                    color: AppTheme.dark,
                  ),
                  autofocus: false,
                  cursorColor: AppTheme.blue,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      fontFamily: AppTheme.fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      height: 1.72,
                      color: AppTheme.gray.withOpacity(0.8),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: SvgPicture.asset(
                          _isObscure == false
                              ? 'assets/icons/eye.svg'
                              : 'assets/icons/eye_off.svg',
                          color: AppTheme.gray,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    color: Colors.transparent,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        fontFamily: AppTheme.fontFamily,
                        height: 1.72,
                        color: AppTheme.dark.withOpacity(0.8),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: () {},
              child: ButtonMain(text: 'Login'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppTheme.gray.withOpacity(0.6),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Or login with',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    fontFamily: AppTheme.fontFamily,
                    height: 1.72,
                    color: AppTheme.dark.withOpacity(0.8),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppTheme.gray.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/google.svg"),
                      SizedBox(width: 16),
                      Text(
                        'Google',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: AppTheme.fontFamily,
                          height: 1.4,
                          color: AppTheme.dark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
