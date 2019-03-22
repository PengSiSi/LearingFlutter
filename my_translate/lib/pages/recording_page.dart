import 'package:flutter/material.dart';
import '../const/const_page.dart';

class RecordingPage extends StatefulWidget {
  @override
  _RecordingPageState createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {

  List<Translate> _items = [
    Translate('title1', 'subTitle1', false),
    Translate('title', 'subTitle2', false),
    Translate('title3', 'subTitle3', false),
    Translate('title4', 'subTitle4', false),
    Translate('title5', 'subTitle5', false),
    Translate('title6', 'subTitle6', false),
    Translate('title7', 'subTitle7', false)
  ];

  Widget _flexView(int index) {
    return  Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            _items[index].title,
            style: Theme.of(context).textTheme.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            _items[index].subTitle,
            style: Theme.of(context).textTheme.subhead,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget _collection(int index) {
    return IconButton(
      icon: Icon(
        _items[index].isCollection ? Icons.star : Icons.star_border,
        size: 25.0,
        color: _items[index].isCollection ? Colors.orange[600] : Colors.grey[600],
      ),
      onPressed: () {
        setState(() {
          _items[index].isCollection = !_items[index].isCollection;
        });
      },
    );
  }

  Widget _displayList(int index) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 2.0,
        left: 0.0,
        right: 0.0
      ),
      child: Card(
        margin: EdgeInsets.only(
          left: .0,
          right: .0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0)
          )
        ),
        child: Container(
          height: 80.0,
          padding: EdgeInsets.only(
            left: 15.0,
            top: 15.0,
            bottom: 15.0
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
             _flexView(index),
             _collection(index)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _displayList(index);
        },
      ),
    );
  }
}