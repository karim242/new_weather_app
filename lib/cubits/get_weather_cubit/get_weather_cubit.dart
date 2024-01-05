 import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/weather_model.dart';
import '../../service/service_weather.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {

  GetWeatherCubit():super(WeatherInitialState());

 WeatherModel? weatherModel;
  GetWeather({required String cityName}) async {
  try{
     weatherModel = await WeatherService(Dio())
        .getCurrentWeather(cityName: cityName);
    emit(WeatherLoadedState(weatherModel: weatherModel!));

}catch(e)
  {
    emit(WeatherFailureState());
  }
}
}