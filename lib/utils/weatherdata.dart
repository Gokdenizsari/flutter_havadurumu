import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'location.dart';

const apikey = "513b94cac5543c0b26995d524616f6cc";

class WeatherData {
  //İçindekileri kullanmak için

  WeatherData({@required this.locationData});

  LocationHelper? locationData;

  double? currentTemperature;
  int? currentCondition;

  Future<void> getCurrentTemperature() async {
    Response response = await get(Uri.http(toString(),
        "https://api.openweathermap.org/data/2.5/weather?lat=39.965894&lon=32.831748&appid=513b94cac5543c0b26995d524616f6cc&unit=metric"));
    //Kontroller

    if (response.statusCode == 200) {
      String data = response.body;

      var currentWeather = jsonEncode(data);
    }
  }
}
