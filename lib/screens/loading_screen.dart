// Loading screen oluşturma sebebimiz verileri internetten alacağımız için
//Bir miktar beklememiz gerekecek o bekleme süresini burda geçirmek için.

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//Dinamik işler yapcağımız için stateful kullanıyoruz
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
