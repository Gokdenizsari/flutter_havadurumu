//Burada sadece işlem yapcağımız için statefull veya statless kullanımına gerek yok
import 'dart:html';

import 'package:location/location.dart';

class LocationHelper {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    //Hem izin alıp hemde kullanıcının lokasyonunu getiricek
    Location location = Location();

    bool _serviceEnabled;
    //Kordinat izni verilmemiş olduğu olabilir
    PermissionStatus _permissionGranted;
    // Locasyonun içinin dolu olup olmadığını kontrolü
    LocationData _locationData;

    // Servis çalışıyor mu diye kontrol
    _serviceEnabled = await location.serviceEnabled();

    // Eğer servisimiz çöktüyse konrol.
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      // Bunu yapmamıza rağmen servis çöktüyse.
      if (!_serviceEnabled) {
        return;
      }
    }

    // Kullanıcının konumunun izini verip vermediği kontrolü
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      //İzin vermesini bekliyoruz
      _permissionGranted = await location.requestPermission();
    }
    if (_permissionGranted != PermissionStatus.granted) {
// Hala izin vermediyse
      return;
    }

    // Eğer izinler tamam ise verilmiş ise
    _locationData = await location.getLocation();
    latitude = _locationData.latitude;
    longitude = _locationData.longitude;
  }
}
