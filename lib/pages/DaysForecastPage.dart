import 'package:flutter/material.dart';

import '../models/DaysForecast.dart';
import '../ui/ForecastListItem.dart';

class FiveDaysForecastPage extends StatelessWidget {
  final DaysForecast _forecast;

  FiveDaysForecastPage(this._forecast);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(_forecast.city, style: TextStyle(fontSize: 30.0),),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: ListView.builder(
          itemCount: _forecast.list.length,
          itemBuilder: (context, int index) {
            return ForecastListItem(_forecast.list[index]);
          },
        ),
      ),
    );
  }
}
