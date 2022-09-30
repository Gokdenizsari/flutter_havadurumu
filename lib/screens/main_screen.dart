import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//Dinamik işlemler yapacağımız için yine stateful kullanırız.

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Burada icon kullanacağız flutter içinde de hazır iconlar var.

      body: Container(
          //Resimlerin çihazlara göre büyük küçük gelmesini ayarlamak için expanded yapmalıyız.
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/günesli.jpg"),
                //Resimin üzerinde icon geleceği için.
                fit: BoxFit.cover),
          ),

          //Icon ve dereceyi container içinde yapacağız.
          //Column ekleyeceğiz dikey sıralama için,
          child: Column(
            //Hizalamasını ayarlamak için
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Piksel mesafesi vermek için boşluk vermek için sizedbox kullan.
              SizedBox(height: 40),
              Container(
                child: Icon(
                  FontAwesomeIcons.sun,
                  size: 75.0,
                  color: Colors.yellowAccent,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(

                  //Şimdilik değerlerimiz sabit sadece dekarasyonu bitirdik.
                  "29°",
                  style: TextStyle(fontSize: 80, letterSpacing: -5),
                ),
              )
            ],
          )),
    );
  }
}
