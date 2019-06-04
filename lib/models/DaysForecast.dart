import './OneDatyForecast.dart';

class DaysForecast {
  final List list;
  final String city;

  DaysForecast({this.list, this.city});

  factory DaysForecast.fromJson(Map<String, dynamic> json) {
    List list = new List();
    String city = json['city']['name'];

    for (dynamic e in json['list']) {
      OneDayForecast w = new OneDayForecast(
          date: new DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000, isUtc: false),
          name: json['city']['name'],
          temp: (e['temp']['day'].toDouble() - 273.15),
          main: e['weather'][0]['main'],
          icon: e['weather'][0]['icon'],
          minTemp: e['temp']['min'].toDouble() - 273.15,
          maxTemp: e['temp']['max'].toDouble() - 273.15,
          humidity: e['humidity'].toDouble(),
          pressure: e['pressure'].toDouble()
          );
      list.add(w);
    }

    return DaysForecast(
      list: list,
      city: city,
    );
  }
}

