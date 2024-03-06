// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            onChanged: (data){
              cityName=data;
            },
            onFieldSubmitted: (data)async{
              Navigator.pop(context);
              cityName=data;
              WeatherService service=WeatherService();
              WeatherModel? weather=  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;
              print(weather);

            },
            keyboardType:TextInputType.text ,
            decoration:  InputDecoration(
              suffixIcon: IconButton(
                  onPressed: ()async{
                    Navigator.pop(context);
                    WeatherService service=WeatherService();
                    WeatherModel? weather=  await service.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                    Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;
                    print(weather);
                  },
                  icon: const Icon(Icons.search),
              ),
              border: const OutlineInputBorder(),
              hintText: 'Enter City Name',
              labelText: 'Search',
              contentPadding: const EdgeInsets.symmetric(vertical: 24,horizontal: 14)
            ),
          ),
        ),
      )
    );
  }
}
