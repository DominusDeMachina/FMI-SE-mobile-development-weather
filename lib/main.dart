import 'package:flutter/material.dart';

import './pages/LandingPage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'FiveYears'),
    home: new LandingPage()
  ));
}