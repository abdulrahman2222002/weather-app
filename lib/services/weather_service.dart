// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';
class WeatherService{
  String baseUrl='http://api.weatherapi.com/v1';
  String apiKey='18d5e7f1c09c44c19da202950232807';
  Future <WeatherModel?> getWeather({required String cityName})async{
    WeatherModel? weather;
    try{
      Uri url =Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response= await http.get(url);
      Map<String,dynamic> data=jsonDecode(response.body);
      weather= WeatherModel.fromJson(data);
    } catch(e){
      print(e);
    }
    return weather;
  }
}