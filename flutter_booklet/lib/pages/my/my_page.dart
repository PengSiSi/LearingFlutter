import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {

  final String title;

  MyPage({Key key, this.title}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Center(
        child: Text('思思'),
      ),
    );
  }
}