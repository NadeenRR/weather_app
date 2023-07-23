import '../model/all_weather_model.dart';
import '../utilities/constants.dart';
import 'location.dart';
import 'networking.dart';

class FeatchData {
  Future<AllWeatherModel> getCurrentLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$kApiKey&units=metric');

    AllWeatherModel weatherInfo = await networkHelper.getData();
    return weatherInfo;
  }

  Future<AllWeatherModel> getCityLocationWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kApiKey');

    AllWeatherModel weatherInfo = await networkHelper.getData();
    return weatherInfo;
  }
}
