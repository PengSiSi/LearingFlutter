import 'package:flutter/material.dart';
import '../../custom/customAppBar.dart';

class HomePage extends StatefulWidget {

  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${widget.title}',  // 获取传进来的title(使用widget获取)
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          )
        ],
      ),
      drawer: getDrawerContainer(context),
      body: Center(
        child: Text('思思'),
      ),
    );
  }
}

getDrawerContainer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.only(top: 30.0),
      children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('思思'),
            accountEmail: Text('1299625033@qq.com'),
            currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554628683373&di=3846c135933ca83eedd5317d2dc8cc72&imgtype=0&src=http%3A%2F%2Fimage.biaobaiju.com%2Fuploads%2F20181004%2F18%2F1538647572-mjJRLNKESk.jpg'),),
            /// 美化当前控件
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://rpic.douyucdn.cn/live-cover/appCovers/2019/03/06/5987179_20190306000039_small.jpg'),
                fit: BoxFit.cover)
            ),
          ),
            ListTile(
              title: Text('用户隐私'),
              trailing: Icon(Icons.feedback),
              onTap: (){
                Navigator.pop(context); // 点击子控件关闭抽屉
              },
            ),
            ListTile(
              title: Text('服务条款'),
              trailing: Icon(Icons.phone),
              onTap: (){
                Navigator.pop(context); // 点击子控件关闭抽屉
              },),
            ListTile(
              title: Text('设置'),
              trailing: Icon(Icons.settings),
              onTap: (){
                Navigator.pop(context); // 点击子控件关闭抽屉
              },),
            Divider(),/// 添加分割线
            ListTile(
              title: Text("退出"),
              trailing: Icon(Icons.exit_to_app),
              onTap: (){
                Navigator.pop(context); // 点击子控件关闭抽屉
              },)
          ],
    ),
  );
}