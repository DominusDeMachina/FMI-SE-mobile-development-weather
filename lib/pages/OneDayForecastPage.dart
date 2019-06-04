import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../models/OneDatyForecast.dart';

class OneDayForecastPage extends StatelessWidget {
  final OneDayForecast weather;

  OneDayForecastPage(this.weather);

  @override
  Widget build(BuildContext context) {

    final warmColor = Colors.redAccent;
    final coldColor = Colors.blueAccent;
    final mainTempSize = 140.0;
    final regularTextSize = 30.0;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              weather.name,
              style: TextStyle(fontSize: 25.0),
            ),
            Text(
              new DateFormat('yMMMMd').format(weather.date),
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: new Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/${weather.icon.substring(0, 2)}.png',
              height: 300.0,
              width: 300.0,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  weather.temp.toStringAsFixed(0),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: mainTempSize,
                    color: weather.temp < 18.0 ? coldColor : warmColor
                  ),
                ),
                Text(
                  "\u00B0",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 140.0,
                      color: weather.temp < 18.0 ? coldColor : warmColor
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  weather.minTemp.toStringAsFixed(0),
                  style: TextStyle(fontSize: regularTextSize, color: weather.minTemp < 18.0 ? coldColor : warmColor),
                ),
                Text(
                  "\u00B0",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: regularTextSize,
                      color: weather.minTemp < 18.0 ? coldColor : warmColor
                      ),
                ),
                Text(
                  " - ",
                  style: TextStyle(fontSize: regularTextSize,),
                ),
                Text(
                  weather.maxTemp.toStringAsFixed(0),
                  style: TextStyle(fontSize: regularTextSize, color: weather.maxTemp < 18.0 ? coldColor : warmColor),
                ),
                Text(
                  "\u00B0",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: regularTextSize,
                      color: weather.maxTemp < 18.0 ? coldColor : warmColor
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Pressure: ",
                  style: TextStyle(fontSize: regularTextSize,),
                ),
                Text(
                  weather.pressure.toStringAsFixed(0),
                  style: TextStyle(fontSize: regularTextSize,),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Humidity: ",
                  style: TextStyle(fontSize: regularTextSize,),
                ),
                Text(
                  weather.humidity.toStringAsFixed(0),
                  style: TextStyle(fontSize: regularTextSize,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
