import 'package:flutter/material.dart';
import './splashScreen.dart';
// import './UserPage.dart'

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Projek PAM08",
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
      // routes: <String,WidgetBuilder>{
      //   '/UserPage':(BuildContext context) => new UserPage(),
      // }
    );
  }
}