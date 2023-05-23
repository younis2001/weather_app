import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates>
{
  WeatherCubit(this.weatherService) : super(WeatherInitialState());
  WeatherService weatherService;
  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String cityName})async
  {
    emit(WeatherLoadingState());
  try{
    weatherModel=await weatherService.getWeather(cityName: cityName);
    emit(WeatherSuccessState(weatherModel: weatherModel!));
  }  on Exception catch (e)
    {
      emit(WeatherErrorState());
    }
  }

}