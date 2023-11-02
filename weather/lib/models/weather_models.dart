class weather {
  final String CityName;
  final double temp;
  final String mainCondition;

  weather({
    required this.CityName,
    required this.temp,
    required this.mainCondition,
  });

  factory weather.fromJson(Map<String, dynamic> json) {
    return weather(
      CityName: json['name'],
      temp: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
