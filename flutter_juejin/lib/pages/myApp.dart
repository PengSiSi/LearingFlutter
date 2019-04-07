import 'package:flutter/material.dart';
import './activityPage.dart';
import './bookPage.dart';
import './indexPage.dart';
import './pinsPage.dart';
import './reposPage.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  final TextStyle tabTextStyleNormal = TextStyle(color: const Color(0xffdddddd));
  final TextStyle tabTextStyleSelected = TextStyle(color: const Color(0xff4d91fd));

  // 底部tab
  final List<Tab> _bottomTabs = <Tab>[
    Tab(
        text: '首页',
        icon: Icon(Icons.home),
      ),
      Tab(
        text: '沸点',
        icon: Icon(Icons.chat),
      ),
      Tab(
        text: '小册',
        icon: Icon(Icons.book),
      ),
      Tab(
        text: '开源库',
        icon: Icon(Icons.bubble_chart),
      ),
      Tab(
        text: '活动',
        icon: Icon(Icons.local_activity),
      ),
  ];
  var _body;
  List _appBarTitles = ['首页', '沸点', '小册', '开源库', '活动'];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: _appBarTitles.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(primaryColor: const Color.fromRGBO(77, 145, 253, 1.0)),
        home: Scaffold(
          appBar: AppBar(
            title: Text('data'),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              IndexPage(),
              PinsPage(),
              BookPage(),
              ReposPage(),
              ActivityPage()
            ],
          ),
          bottomNavigationBar: Material(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              tabs: _bottomTabs,
              controller: _tabController,
              indicatorColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}