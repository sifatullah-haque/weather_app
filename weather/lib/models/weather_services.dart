import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather/models/weather_models.dart';

class weatherServices {
  String Base_url = "http://api.openweathermap.org/data/2.5/weather/";
  final String apiKeys;
  weatherServices({required this.apiKeys});
  Future<weather> getWeather(String cityName) async {
    final Response response = await get(
        Uri.parse("$Base_url?q=$cityName&appid=$apiKeys&units=metric"));
    if (response.statusCode == 200) {
      return weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error Loading Data");
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemark[0].locality;
    return city ?? "";
  }
}
