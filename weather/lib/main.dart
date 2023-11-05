import 'package:flutter/material.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/pages/weather_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
