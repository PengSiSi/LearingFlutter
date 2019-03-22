import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import './cityData.dart';
import '../weather/weatherWidget.dart';
import 'package:http/http.dart' as http;

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {

  List<CityData> cityList = new List<CityData>();

  _CityPageState() {
    _getCityList();
  }

  _getCityList() async {
    List<CityData> citys = await _fetchCityList();
    setState(() {
      cityList = citys;
    });
  }

  Future<List<CityData>> _fetchCityList() async{
    final response = await http.get('https://search.heweather.net/top?group=cn&key=ebb698e9bb6844199e6fd23cbb9a77c5');

    List<CityData> cityList = new List<CityData>();

    if(response.statusCode == 200){
      //解析数据
      Map<String,dynamic> result = json.decode(response.body);
      for(dynamic data in result['HeWeather6'][0]['basic']){
        CityData cityData = CityData(data['location']);
        cityList.add(cityData);
      }
      return cityList;
    }else{
      return cityList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('城市选择'),
      ),
      body: ListView.builder(
      itemCount: cityList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: GestureDetector(
            child: Text(
              cityList[index].cityName,
            ),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder:(context) => WeatherWidget(cityList[index].cityName) )
              );
            },
          ),
        );
      },
    ),
    );
  }
}