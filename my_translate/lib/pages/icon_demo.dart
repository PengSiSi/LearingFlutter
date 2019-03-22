import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IconDemo extends StatefulWidget {

  @override
  _IconDemoState createState() => _IconDemoState();
}

class _IconDemoState extends State<IconDemo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(width: 10.0,),
        ActionButton(
          title: '相机',
          icon: Icons.switch_camera,
          image: AssetImage(''),
        ),
        ActionButton(
          title: '手写',
          icon: CupertinoIcons.pen,
          image: AssetImage(''),
        ),
        ActionButton(
          title: '对话',
          //icon: Icons.add,
          image: AssetImage('images/ic_double_mic_24dp.png'),
        ),
        ActionButton(
          title: '语音',
          icon: Icons.keyboard_voice,
          image: AssetImage(''),
        ),
        Container(width: 10.0,)
      ],
    );
  }
}

class ActionButton extends StatefulWidget {

  final String title;
  final IconData icon;
  final AssetImage image;
  ActionButton({Key key, @required this.title, this.icon, this.image}) :super(key:key);
  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {

  Widget _displayIcon() {
    if (widget.icon != null) {
      return Icon(
        widget.icon,
        color: Color(0xff3F51B5),
        size: 25.0,
      );
    } else if (widget.image != null) {
      return ImageIcon(
        widget.image,
        color: Color(0xff3F51B5),
        size: 25.0,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {

      },
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 2.0,
        bottom: 2.0
      ),
      child: Column(
        children: <Widget>[
          _displayIcon(),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0
            ),
          ),
        ],
      ),
    );
  }
}