import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

import '../model/all_weather_model.dart';
import '../utilities/constants.dart';
import 'featch_data.dart';

class WeatherModel {
  // double temp = 0;
  // int weatherId = 0;
  // late String name;
  // late String country;
  // late num tempMin;
  // late num tempMax;
  // late num speedWind;
  // late String weatherMain;
  // late String description;
  // late String main;
  // late String iconCode;
  // Location location = Location();

  // Future<WeatherModel> getCurrentLocationWeather() async {
  //   await location.getCurrentLocation();

  //   NetworkHelper networkHelper = NetworkHelper(
  //       url:
  //           'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$kApiKey&units=metric');

  //   WeatherModel weatherInfo = await networkHelper.getData();
  //   return weatherInfo;

  //   // temp = weatherInfo['main']['temp'];
  //   // weatherId = weatherInfo['weather'][0]['id'];
  //   // weatherMain = weatherInfo['weather'][0]['main'];
  //   // tempMin = weatherInfo['main']['temp_min'];
  //   // tempMax = weatherInfo['main']['temp_max'];
  //   // name = weatherInfo['name'];
  //   // country = weatherInfo['sys']['country'];
  //   // speedWind = weatherInfo['wind']['speed'];
  //   // description = weatherInfo['weather'][0]['description'];
  //   // iconCode = weatherInfo['weather'][0]['icon'];
  //   //   main = weatherInfo['weather']['main'];
  // }

  // Future<void> getCityLocationWeather(String cityName) async {
  //   Map<String, dynamic> weatherInfo = await NetworkHelper(
  //           url:
  //               'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kApiKey')
  //       .getData();

  //   temp = weatherInfo['main']['temp'];
  //   weatherId = weatherInfo['weather'][0]['id'];
  //   weatherMain = weatherInfo['weather'][0]['main'];
  //   tempMin = weatherInfo['main']['temp_min'];
  //   tempMax = weatherInfo['main']['temp_max'];
  //   name = weatherInfo['name'];
  //   country = weatherInfo['sys']['country'];
  //   speedWind = weatherInfo['wind']['speed'];
  //   description = weatherInfo['weather'][0]['description'];
  //   // iconCode = weatherInfo['weather'][0]['icon'];
  //   //   main = weatherInfo['weather']['main'];
  // }
  FeatchData? featchData;
  AllWeatherModel? allWeatherModel;

  Future<AllWeatherModel?> getModelData() async {
    allWeatherModel = await featchData?.getCurrentLocationWeather();
    return allWeatherModel;
  }

  String getWeatherIcon({required int id}) {
    if (id < 300) {
      return 'assets/icons/thunderstorm.png';
    } else if (id < 400) {
      return 'assets/icons/drizzle.png';
    } else if (id < 600) {
      return 'assets/icons/rain.png';
    } else if (id < 700) {
      return 'assets/icons/snow.png';
    } else if (id < 800) {
      return 'assets/icons/haze.png';
    } else if (id == 800) {
      return 'assets/icons/clear.png';
    } else if (id <= 804) {
      return 'assets/icons/clouds.png';
    } else {
      return 'assets/icons/other.png';
    }
  }

  // LinearGradient getColorBC() {
  //   if (allWeatherModel!.id! < 300) {
  //     return LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //         colors: [Color.fromRGBO(8, 247, 254, 1), Color(0xFF08F7FE)]);
  //   } else if (allWeatherModel!.id < 400) {
  //     return LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //         colors: [Color(0xFF08F7FE), Color(0xFF08F7FE)]);
  //   } else if (allWeatherModel!.id < 600) {
  //     return LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //         colors: [Color(0xFF08F7FE), Color(0xFF08F7FE)]);
  //   } else if (allWeatherModel!.id < 700) {
  //     return LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //         colors: [Color(0xFF08F7FE), Color(0xFF08F7FE)]);
  //   } else if (allWeatherModel!.id < 800) {
  //     return LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //         colors: [Color(0xFF08F7FE), Color(0xFF08F7FE)]);
  //   } else if (allWeatherModel!.id == 800) {
  //     return LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //         colors: [Color(0xFF08F7FE), Color.fromRGBO(8, 247, 254, 1)]);
  //   } else if (allWeatherModel!.id <= 804) {
  //     return LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //         colors: [Color(0xFF08F7FE), Color(0xFF08F7FE)]);
  //   } else {
  //     return LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //         colors: [Color(0xFF08F7FE), Color(0xFF08F7FE)]);
  //   }
  // }

  String getMessage() {
    if (allWeatherModel!.main.temp > 25) {
      return 'It\'s 🍦 time';
    } else if (allWeatherModel!.main.temp > 20) {
      return 'Time for shorts and 👕';
    } else if (allWeatherModel!.main.temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
