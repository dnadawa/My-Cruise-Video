import 'package:flutter/material.dart';
import 'package:mycruisevideo/screens/first-page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff448AFF),
        accentColor: Color(0xff8044FF),
        canvasColor: Color(0xff448AFF),
      ),
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
