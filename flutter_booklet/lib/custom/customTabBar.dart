import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/my/my_page.dart';

class CustomTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '学习Flutter',
      home: _CustomTabBar(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70, /// 溅墨效果
      ),
    );
  }
}

class _CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<_CustomTabBar> {

 final List<Widget> _children = [
    HomePage(title: '首页'),
    HomePage(title: '首页'),
    HomePage(title: '首页'),
    MyPage(title: '我的',)
  ];

  final List<BottomNavigationBarItem>_items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.contacts),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.disc_full),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('我的')
    )
  ];

  // 当前选中index
  int _currentIndex = 0;

  // 点击tabbar的回调
  void _onTapTabbarHandle(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // 使用IndexedStack存储界面,防止每次都重新加载数据
        children: _children,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        onTap: _onTapTabbarHandle,
        items: _items,
      ),
    );
  }
}