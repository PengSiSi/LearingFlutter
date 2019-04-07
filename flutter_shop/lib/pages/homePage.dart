import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  // 保持页面状态
  @override
  bool get wantKeepAlive => true;

  String homePageContent = '正在获取数据';

  @override
  void initState() {
    getHomePageContent().then((val) {
      setState(() {
        homePageContent = val.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            print(data);
            List<Map> swiper = (data['data']['slides'] as List).cast();
            List<Map> navigatorList = (data['data']['category'] as List).cast();
            String adPicture = (data['data']['advertesPicture']['PICTURE_ADDRESS']);
            String leaderImage = (data['data']['shopInfo']['leaderImage']);
            String leaderPhone= (data['data']['shopInfo']['leaderPhone']);
            List<Map> recommendList = (data['data']['recommendList']);
            return Column(
              children: <Widget>[
                SwiperDiy(swiperDataList: swiper),
                TopNavigator(navigatorList: navigatorList),
                AdBanner(adPicture: adPicture),
                LeaderPhone(leaderImage: leaderImage, leaderPhone: leaderPhone),
                //Recommend(recommendList: recommendList)
              ],
            );
          } else {
            return Center(
              child: Text(
                '加载中。。。',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            );
          }
        },
      )
    );
  }
}

// 首页轮播组件
class SwiperDiy extends StatelessWidget {
  
  final List swiperDataList;
  SwiperDiy({this.swiperDataList});

  @override
  Widget build(BuildContext context) {
    // print('设备像素密度：${ScreenUtil.pixelRatio}');
    // print('设备宽度：${ScreenUtil.screenWidth}');
    // print('设备像高度：${ScreenUtil.screenHeight}');

    //ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Container(
      height: 300,
      // width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network('${swiperDataList[index]['image']}', fit: BoxFit.fitHeight);
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// GrideView组件
class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: 50),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {  // 取前10个
      this.navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: 180,
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

// 广告组件
class AdBanner extends StatelessWidget {
  final String adPicture;

  AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}

// 店长电话模块
class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  // 拨打电话
  void _launchURL() async{
    String url = 'tel:' + leaderPhone;
    print('url = ${url}');   // tel:03936188699
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'url不能进行访问，异常';
    }
  }
}

// 商品推荐模块
class Recommend extends StatelessWidget {
  final List recommendList;
  Recommend({Key key, this.recommendList}) : super(key: key);

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0.0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12)
        )
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  // 商品单独项方法
  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 330,
        width: 250,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: Colors.black12, width: 0.5)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('${recommendList[index]['mallPrice']}'),
            Text(
              '${recommendList[index]['price']}',
              style: TextStyle(
                color: Colors.red
              ),
            )
          ],
        ),
      ),
    );
  }

  // 横向列表方法
  Widget _recommendList() {
    return Container(
      height: 330.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: _listItemBuilder,
      ),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            '标题',
            style:Theme.of(context).textTheme.title // 文字主题
          ),
          SizedBox(height: 16.0),
          Text(
            '哈哈',
            style:Theme.of(context).textTheme.title // 文字主题
          ),
          SizedBox(height: 16.0)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList()
        ],
      ),
    );
  }
}