import 'dart:developer';

import 'package:dio/dio.dart';
import '../model/weather_model.dart';


class WeatherService{
  final String baseUrl="http://api.weatherapi.com/v1";
  final String apiKey ="a64ed6138f35494a8ff145413240301";
  final Dio dio;
WeatherService(this.dio);

Future<WeatherModel> getCurrentWeather({required String cityName})async{
 try {
   Response response = await dio.get("$baseUrl/forecast.json?"
       "key=$apiKey&q=$cityName&days=1");
   WeatherModel weatherModel = WeatherModel.fromJson(response.data);

   return weatherModel;
 }on DioException catch(e)
  {
    final String errMessage = e.response?.data['error']['message']??
        "OOPS there was an error ,try later";
    throw Exception(errMessage);
  }catch(e)
  {
    log(e.toString());
    throw Exception("OOPS there was an error ,try later");

  }
}
}