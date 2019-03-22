import 'package:flutter/material.dart';
import './icon_demo.dart';

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0, // 阴影
      margin: EdgeInsets.all(0.0),
      child: Container(
        height: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextDemo(),
            IconDemo(),
            Container(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,  // 获取上级容器的高度
        padding: EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          bottom: 20.0,
          top: 2.0
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '点按即可输入文本'
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 23.0
          ),
          maxLines: 999,
          cursorColor: Colors.grey[500],  // 光标颜色
          cursorWidth: 2.0,  // 光标宽度
        ),
      ),
    );
  }
}