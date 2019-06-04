import 'dart:convert';

import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/DaysForecast.dart';

import '../pages/DaysForecastPage.dart';

const OWM_ID = 'b18bc1d757d5cd843ebcaf7ec769aa76';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  DaysForecast forecast;
  bool isLoading = false;
  Location _location = new Location();
  String error;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(isLoading ? Icons.wb_cloudy : Icons.wb_sunny, size: 80.0,),
          Text("Weather", style: TextStyle(fontSize: 50.0),),
        ],
      ),
    );
  }

  loadData() async {
    setState(() {
      isLoading = true;
    });

    Map<String, double> location;
    try {
      location = await _location.getLocation();
      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask user';
        location = null;
      }
    }

    if (location != null) {
      // final lat = 40.730610;
      // final lon = -73.935242;
      final lat = location['latitude'];
      final lon = location['longitude'];

      final url =
          'https://api.openweathermap.org/data/2.5/forecast/daily?APPID=$OWM_ID&lat=${lat.toString()}&lon=${lon.toString()}&cnt=7';
      final forecastResponse = await http.get(url);
      if (forecastResponse.statusCode == 200) {
        setState(() {
          forecast =
              new DaysForecast.fromJson(jsonDecode(forecastResponse.body));
          isLoading = false;
        });
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (BuildContext context) {
          return new FiveDaysForecastPage(forecast);
        }));
      }
    }
  }
}