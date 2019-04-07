import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import './weatherData.dart';
import 'dart:convert';

class WeatherWidget extends StatefulWidget {

  String cityName;
  WeatherWidget(this.cityName);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState(this.cityName);
}

class _WeatherWidgetState extends State<WeatherWidget> {

  String cityName;
  WeatherData weather = WeatherData.empty();

  _WeatherWidgetState(String cityName) {
    this.cityName = cityName;
    _getWeather();
  }

  _getWeather() async {
    WeatherData data = await _fetchWeather();
    setState(() {
      weather = data;
    });
  }

  Future<WeatherData> _fetchWeather() async {
    final response = await http.get('https://free-api.heweather.com/s6/weather/now?location=' + this.cityName + '&key=ebb698e9bb6844199e6fd23cbb9a77c5');
    if (response.statusCode == 200) {
      debugPrint('response.body = ' + response.body);
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      return WeatherData.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前城市天气'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'images/weather_bg.jpg',
            fit: BoxFit.fitHeight,
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 40.0),
                child: Text(
                  this.cityName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 100.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '20', //weather.tmp,
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 80.0
                        )
                      ),
                      Text(
                        '晴', //weather.cond,
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 45.0
                        )
                      ),
                      Text(
                        '湿度 80%', //weather.hum,
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 30.0
                        )
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}