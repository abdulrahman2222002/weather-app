import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Screens/home_page.dart';
import 'package:weather/providers/weather_provider.dart';


void main() {
  runApp( ChangeNotifierProvider(
    create: (context){
      return WeatherProvider();
    },
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData?.themColor() ,
      ),
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}
