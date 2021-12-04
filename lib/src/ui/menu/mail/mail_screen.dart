import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MailScreen extends StatefulWidget {

  @override
  _MailScreenState createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Mail"
        ),
      ),
    );
  }
}
