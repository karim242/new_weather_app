
import '../../model/weather_model.dart';

class WeatherState {}
class WeatherInitialState extends WeatherState {}
class WeatherLoadedState extends WeatherState {
   WeatherModel weatherModel;
   WeatherLoadedState({required this.weatherModel});
}
class WeatherFailureState extends WeatherState {}