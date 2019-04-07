import 'package:flutter/material.dart';
import '../util//dataUtils.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  List _listData;

  @override
  void initState() {
    getList(false);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('IndexPage'),
    );
  }

  getList(bool isLoadMore) {
    DataUtils.getIndexListData().then((resultList) {
      setState(() {
        _listData = resultList;
      });
    });
  }
}