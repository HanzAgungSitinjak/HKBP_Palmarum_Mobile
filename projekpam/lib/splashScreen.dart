import 'package:flutter/material.dart';
import './Login_Page.dart';
import 'package:projekpam/utils/global.colors.dart';
import 'dart:async';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login_Page()));
    });//timer
  } // void init

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         width: MediaQuery.of(context).size.width,
         color: Colors.white,
         child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children:[
             Image.asset(
                 'assets/images/logo.png',
               width: 300,
               height: 300,
             ),  //image.asset
             Text(
               'HKBP Palmarum',
               style: TextStyle(
                 fontSize: 18,
                 color: GlobalColors.mainColor,
                 fontWeight: FontWeight.bold,
               ), // TextStyle
             ), //Text
           ],
         ), //column
       ), //Container
    ); //Scaffold
  }
}
