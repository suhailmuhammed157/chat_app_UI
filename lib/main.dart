import 'package:chat_app_machine_test/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLASHAT',
      theme: ThemeData(
        primaryColor: Color(0xFF3CE333),
        accentColor: Color(0xFFBFF3BD),
      ),
      home: HomeScreen(),
    );
  }
}
