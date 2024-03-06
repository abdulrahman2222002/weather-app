
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Screens/search_page.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  WeatherModel? weatherData;


  @override
  Widget build(BuildContext context) {
    weatherData =Provider.of<WeatherProvider>(context).weatherData;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [IconButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(
                  builder: (context) =>  SearchPage()),);
            },
            icon: const Icon(
                Icons.search,
            ),
        )],
      ),
      body:
        weatherData==null? const Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            'there is no weather 😔 start searching now 🔍',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
      ) : Container(
          decoration: BoxDecoration(

            gradient: LinearGradient(
              colors: [
                weatherData!.themColor(),
                weatherData!.themColor()[300]!,
                weatherData!.themColor()[200]!,
                weatherData!.themColor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),

        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Spacer(flex: 3,),
             Text(
            "${Provider.of<WeatherProvider>(context).cityName}" ,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

             Text(
            'Updated: ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData!.getImage()),
                 Text(
                  weatherData!.temp.toInt().toString(),
                  style: const TextStyle(
                    fontSize: 28,

                  ),
                ),
                Column(
                  children:  [
                    Text(
                     weatherData!.maxTemp.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 14,

                      ),
                    ),
                    Text(
                      weatherData!.minTemp.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 14,

                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
             Text(
              weatherData!.weatherStateName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(flex: 5,),
          ],
        ),
      ),

    );
  }
}
