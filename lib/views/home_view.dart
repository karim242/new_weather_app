import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/views/search_view.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:  Text('Weather App'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const SearchView();
                  }),
                );
              }),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: ( context,  state) {
          if(state is WeatherInitialState)
            {
              return const NoWeatherBody();
            }
          else if(state is WeatherLoadedState)
            {
              return  WeatherInfoBody(
                weather: state.weatherModel,
              );
            }
          else {
            return const Text("OOPs there was error ,try later");
          }
        },),
    );
  }
}
