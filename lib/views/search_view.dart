import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';
class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text(
          "Search a City",
          style: TextStyle(

              fontWeight: FontWeight.bold),
        ),
      ),
      body:Center(
        child: TextField(
          onSubmitted: (value)async{
          var getCurrentWeather=BlocProvider.of<GetWeatherCubit>(context);
          getCurrentWeather.GetWeather(cityName: value);
          Navigator.pop(context);
          },
          decoration:const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter City Name",
            suffixIcon: Icon(Icons.search),
            labelText: "Search",
            contentPadding: EdgeInsets.symmetric(vertical: 28,horizontal: 16)

          )
        ),
      )
    );
  }
}