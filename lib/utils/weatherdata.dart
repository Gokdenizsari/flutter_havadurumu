import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import 'location.dart';

const apikey = "513b94cac5543c0b26995d524616f6cc";

class WeatherDisplayData {
  Icon weathericon;
  AssetImage weatherImage;
  WeatherDisplayData({required this.weatherImage, required this.weathericon});
}

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
//Decode yapma nedenimiz json dan cevirdiğimiz için
      var currentWeather = jsonDecode(data);

      // Kontrol yapmak için
      try {
        currentTemperature = currentWeather["main"]["temp"];
        currentCondition = currentWeather["weather"][0]["id"];
      } catch (e) {
        print(e);
      }
      {
        print("API DEĞERLERİ GELMİYOR");
      }
    }
//Veri taşıma işlemi yapmak için fonksiyon
    WeatherDisplayData? getWeatherDisplay() {
      if (currentCondition! < 600) {
        return WeatherDisplayData(
            weatherImage: AssetImage("assets/bulutlu.jpg"),
            weathericon: Icon(
              FontAwesomeIcons.cloud,
              size: 75,
              color: Colors.white,
            ));
      } else {
        var now = new DateTime.now();
        if (now.hour >= 19) {
          return WeatherDisplayData(
              weatherImage: AssetImage("assets/günbatımı.jpg"),
              weathericon: Icon(FontAwesomeIcons.cloud));
        } else {
          return WeatherDisplayData(
              weatherImage: AssetImage("assets/günesli.jpg"),
              weathericon: Icon(FontAwesomeIcons.cloud));
        }
      }
    }
  }
}
