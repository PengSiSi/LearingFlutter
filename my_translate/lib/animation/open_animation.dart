import 'package:flutter/material.dart';
import '../pages/index_page.dart';

class OpenAnimation extends StatefulWidget {
  @override
  _OpenAnimationState createState() => _OpenAnimationState();
}

// with相当于继承
class _OpenAnimationState extends State<OpenAnimation> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this
    );
    _animation = Tween(begin: 0, end: 1).animate(_controller);
    _animation.addStatusListener((status) {
      if (status ==AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return IndexPage();
          }), 
          (route) => route == null);
      }
    });
    _controller.forward();  // 控制器控制播放
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _controller,
        child: Image.asset(
          'images/Open_animation.png',
          fit: BoxFit.cover,
          ),
      );
  }
}