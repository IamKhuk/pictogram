import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlusScreen extends StatefulWidget {

  @override
  _PlusScreenState createState() => _PlusScreenState();
}

class _PlusScreenState extends State<PlusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Plus',
        ),
      ),
    );
  }
}
