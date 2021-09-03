import 'package:flutter/material.dart';

class DayNightProvider extends ChangeNotifier {
  bool isNight = true;
  var _dayNightColors = [
    [
      Colors.blueGrey.shade900,
      Colors.lightBlue.shade900,
      //night light
    ],
    [
      Colors.cyan,
      Colors.lightBlue.shade900,
      //day light
    ]
  ];
  List<Color> backGroundColors = [
    Colors.blueGrey.shade900,
    Colors.lightBlue.shade900,
    //night light
  ];

  changeAppMode() {
    isNight = !isNight;
    backGroundColors = isNight ? _dayNightColors.first : _dayNightColors.last;
    notifyListeners();
  }
}
