import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('思思学习'),
            accountEmail: Text('1299625033@qq.com'),
            currentAccountPicture: null,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/bg_account_switcher.png')
              )
            ),
          ),
          ListTile(
            title: Text('首页', style: TextStyle(color: Colors.blue[600]), ),
            //leading: Icon(CupertinoIcons.home),
            leading: ImageIcon(
              AssetImage('images/quantum_ic_home_black_24.png'),
              color: Colors.blue[600],
              ),
            onTap: () {

            },
          ),
          ListTile(
            title: Text('翻译收藏夹'),
            //leading: Icon(CupertinoIcons.location),
            leading: ImageIcon(AssetImage('images/quantum_ic_stars_black_24.png')),
            onTap: () {
              
            },
          ),
          ListTile(
            title: Text('离线翻译'),
            //leading: Icon(CupertinoIcons.music_note),
            leading: ImageIcon(AssetImage('images/quantum_ic_offline_pin_black_24.png')),
            onTap: () {
              
            },
          ),
          ListTile(
            title: Text('设置'),
            //leading: Icon(CupertinoIcons.settings),
            leading: ImageIcon(AssetImage('images/quantum_ic_settings_black_24.png')),
            onTap: () {
              
            },
          )
        ],
      )
    );
  }
}