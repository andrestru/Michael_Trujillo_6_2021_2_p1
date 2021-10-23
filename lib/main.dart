import 'package:flutter/material.dart';
import 'package:michael_trujillo_6_2021_2_p1/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notices',
      home: HomeScreen(),
    );
  }
}
