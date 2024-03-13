import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../weather.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? _weather;

  Weather? get weather => _weather;

  Future<void> fetchWeather(String cityName) async {
    final apiKey = 'a4c653c68735b4db6335035a2cdc9a5d';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      _weather = Weather.fromJson(json.decode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
