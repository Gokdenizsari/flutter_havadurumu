// Loading screen oluşturma sebebimiz verileri internetten alacağımız için
//Bir miktar beklememiz gerekecek o bekleme süresini burda geçirmek için.

import 'package:flutter/material.dart';
import 'package:flutter_havadurumu/utils/location.dart';
import 'package:flutter_havadurumu/utils/weatherdata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Dinamik işler yapcağımız için stateful kullanıyoruz
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Takip etmemiz için buraya tanımlamalıyız.
  LocationHelper? locationData;

  Future<void> getLocationData() async {
    locationData = LocationHelper();
    await locationData!.getCurrentLocation();

    if (locationData!.latitude == null || locationData!.longitude == null) {
      print("Konum bilgisi yok");
    } else {
      print("latitude:" + locationData!.latitude.toString());
      print("Longitute:" + locationData!.longitude.toString());
    }
  }

//Yeni bir fonksiyon yapıyoruz bu da hava durumu bilgilerini getiricek.
//geri dönmesine gerek olmadıgı için vıid
  void getWeatherData() async {
    WeatherData weatherData = WeatherData(
        locationData:
            locationData /*Hemen location data isteme nedeni required yapmamız*/);
    await weatherData.getCurrentTemperature();
    //Bilgilerin geldiğini kontrol etmek için if else

    if (weatherData.currentTemperature == null ||
        weatherData.currentCondition == null) {
      print("APİ' den sıcaklık veya durum bilgisi gelmiyor.");
    }
  }

  //Otomatik olarak çağırmak için
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Container içinde dekorasyonunu değiştirebiliriz.
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              //Renklerin başlagıcını ve bitişini ayarlamak için
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange]),
        ),
        //Tam ortada olmasını istediğimiz için Center kullanıyoruz
        child: Center(
          child: SpinKitCircle(
            //Renk
            color: Colors.greenAccent,
            //Büyüklüğü
            size: 130.0,
            //Süresi
            duration: Duration(milliseconds: 1200),
          ),
        ),
      ),
    );
  }
}
