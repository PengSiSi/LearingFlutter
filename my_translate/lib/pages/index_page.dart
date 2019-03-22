import 'package:flutter/material.dart';
import './drawer_page.dart';
import './body_page.dart';
import './textField_page.dart';
import './recording_page.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Goole Translate'),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            IndexBody(),
            TextFieldDemo(),
            RecordingPage()
          ],
        ),
        drawer: DrawerPage(),
      ),
    );
  }
}