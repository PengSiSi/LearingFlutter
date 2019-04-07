import 'package:flutter/material.dart';
import '../../custom/customAppBar.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils//util.dart';

class MyPage extends StatefulWidget {

  final String title;
  MyPage({Key key, this.title}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  final List<List<MyModel>> items = [
    [
      MyModel('收藏', Icon(Icons.toc)),
      MyModel('代办', Icon(Icons.today)),
      MyModel('红包', Icon(Icons.receipt)),
    ],
    [
      MyModel('代办', Icon(Icons.today)),
      MyModel('红包', Icon(Icons.receipt)),
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '我的',
      ),
      body: getListViewContainer()
    );
  }

  getListViewContainer() {
    return SectionTableView(
      sectionCount: items.length,
      numOfRowInSection: (section) {
        return items[section].length;
      },
      cellAtIndexPath: (section, index) {
        return GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
              msg: '点击了。。。',
              gravity: ToastGravity.CENTER
            );
          },
          child: getItemContainer(items[section][index]),
        );
      },
      headerInSection: (section) {
        return section == 0 ? getHeaderViewContainer() :getGroupTextContainer(section);
      },
    );
  }

  getHeaderViewContainer() {
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            //flex: 0,
            child: ExtendedImage.network(
              'https://rpic.douyucdn.cn/live-cover/appCovers/2019/03/14/5777969_20190314185355_small.jpg',
              fit: BoxFit.cover,
              cache: true,
              ),
          ),
          getGroupTextContainer(0),
        ],
      ),
    );
  }

  getGroupTextContainer(int index) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        '第${index + 1}组',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20.0),
      )
    );
  }

  getItemContainer(MyModel model) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: model.icon,
          title: Text('${model.title}'),
          trailing: Icon(Icons.navigate_next),
        )
      ],
    );
  }
}

class MyModel {
  String title;
  Icon icon;
  MyModel(this.title, this.icon);
}