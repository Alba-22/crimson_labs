import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crimson Labs',
      theme: ThemeData(
        primaryColor: Color(0xFFDC143C),
        accentColor: Color(0xFFED224B),
        fontFamily: "Gotham"
      ),
      home: Container(),
    );
  }
}