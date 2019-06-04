import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../models/OneDatyForecast.dart';

import '../pages/OneDayForecastPage.dart';

final todayDate = new DateFormat("d").format(new DateTime.now());

class ForecastListItem extends StatelessWidget {
  final OneDayForecast _item;

  ForecastListItem(this._item);

  @override
  Widget build(BuildContext context) {
    var eDateStr = "";
    if (todayDate == new DateFormat('d').format(_item.date)) {
      eDateStr = "Today";
    } else {
      eDateStr = new DateFormat("EEEE").format(_item.date);
    }
    return InkWell(
      onTap: () => Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) {
            return new OneDayForecastPage(_item);
          })),
      child: ListTile(
        leading: Material(
            color: Colors.transparent,
            child: Image.asset(
          'assets/${_item.icon.substring(0, 2)}.png',
          width: 40.0,
          height: 40.0,
        )),
        title: Text(
          eDateStr,
          style: TextStyle(
              fontWeight:
                  eDateStr == 'Today' ? FontWeight.bold : FontWeight.normal,
              fontSize: 25.0),
        ),
        trailing: Text(
          _item.temp.toStringAsFixed(0) + "\u00B0",
          style: TextStyle(
              fontWeight:
                  eDateStr == 'Today' ? FontWeight.bold : FontWeight.normal,
              fontSize: 30.0),
        ),
      ),
    );
  }
}
