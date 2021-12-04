import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendScreen extends StatefulWidget {

  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Send'
        ),
      ),
    );
  }
}
