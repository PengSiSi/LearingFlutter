import 'package:flutter/material.dart';

Color primaryColor = Colors.blue[600];


class IndexBody extends StatefulWidget {
  @override
  _IndexBodyState createState() => _IndexBodyState();
}

class _IndexBodyState extends State<IndexBody> {
  String _firstLanguage = '英语';
  String _secondLanguage = '中文(简体)';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey[500]
          )
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              width: 50.0,
            ),
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                      _firstLanguage,
                      style: TextStyle(color: primaryColor),
                    ),
                    ImageIcon(
                      AssetImage('images/spinner_blue.9.png'),
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: IconButton(
              icon: Icon(Icons.compare_arrows),
              color: primaryColor,
              onPressed: () {

              },
            ),
            ),
            SizedBox(
              width: 60.0,
            ),
            Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                      _secondLanguage,
                      style: TextStyle(color: primaryColor),
                    ),
                    ImageIcon(
                      AssetImage('images/spinner_blue.9.png'),
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}