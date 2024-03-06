
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';



class WeatherModel{
   DateTime date;
   double temp;
   double maxTemp;
   double minTemp;
   String weatherStateName;
   WeatherModel({
     required this.date,
     required this.temp,
     required this.maxTemp,
     required this.minTemp,
     required this.weatherStateName,
});
  factory WeatherModel.fromJson(Map<String,dynamic> data){
    var jsonData=data ['forecast']['forecastday'][0]['day'];

    //format the date
    String dateString = '${data['location']['localtime']}';
    DateFormat inputFormat = DateFormat('yyyy-MM-dd h:mm');
    DateTime dateTime = inputFormat.parse(dateString );

    return WeatherModel(
      date:dateTime,
      temp:jsonData ['avgtemp_c'],
      maxTemp:jsonData['maxtemp_c'],
      minTemp:jsonData['mintemp_c'],
      weatherStateName:jsonData['condition']['text'],
    );
  }
  String getImage(){
    if (weatherStateName=='Clear' || weatherStateName=='Light Cloud'||
        weatherStateName=='Sunny'){
      return 'assets/images/clear.png';
    } else if(weatherStateName== 'Sleet' ||
        weatherStateName== 'Snow'||
        weatherStateName== 'Hail' ){
      return 'assets/images/snow.png';
    } else if(weatherStateName== 'Heavy Cloud'){
      return 'assets/images/cloudy.png';
    } else if(weatherStateName== 'Light Rain' ||
        weatherStateName== 'Patchy rain possible' ||
        weatherStateName== 'Moderate rain' ||
        weatherStateName== 'Heavy rain'||
        weatherStateName== 'Showers' ){
      return 'assets/images/rainy.png';
    }else if(weatherStateName== 'Thunderstorm'){
      return 'assets/images/thunderstorm.png';
    } else {
      return'assets/images/clear.png';
    }
  }

  MaterialColor themColor(){
    if (weatherStateName=='Clear' || weatherStateName=='Light Cloud'||
        weatherStateName=='Sunny'){
      return Colors.orange ;
    } else if(weatherStateName== 'Sleet' ||
        weatherStateName== 'Snow'||
        weatherStateName== 'Hail' ){
      return Colors.blue;
    } else if(weatherStateName== 'Heavy Cloud'){
      return Colors.blueGrey;
    } else if(weatherStateName== 'Light Rain' ||
        weatherStateName== 'Patchy rain possible' ||
        weatherStateName== 'Moderate rain' ||
        weatherStateName== 'Heavy rain'||
        weatherStateName== 'Showers' ){
      return Colors.blue;
    }else if(weatherStateName== 'Thunderstorm'){
      return Colors.grey;
    } else {
      return Colors.blue;
    }
  }
  @override
  String toString() {

    return 'date: $date  temp: $temp  maxTemp: $maxTemp  minTemp: $minTemp  weatherStateName: $weatherStateName';
  }

}

