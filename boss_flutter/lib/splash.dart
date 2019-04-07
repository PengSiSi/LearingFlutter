import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  Timer _t;

  @override

  void initState() { 
    super.initState();
    _t =Timer(const Duration(milliseconds: 1500), () {
      
    });
  }

  @override
  void dispose() { 
    _t.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 150.0),
        child: Column(
          children: <Widget>[
            Text(
              'BOSS直聘',
              style:TextStyle(
                fontSize: 54.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
            )
          ],
        ),
      ),
    );
  }
}
