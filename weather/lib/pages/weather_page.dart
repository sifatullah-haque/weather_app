import 'package:flutter/material.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/models/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherServices =
      weatherServices(apiKeys: "cd34b14241fa23c728a06fff3598d02a");
  weather? _weather;

  _featchWeather() async {
    String cityName = await _weatherServices.getCurrentCity();
    try {
      final weather = await _weatherServices.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _featchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [Text("hello world")],
      )),
    );
  }
}
