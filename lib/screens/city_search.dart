import 'package:flutter/material.dart';

import '../model/all_weather_model.dart';
import '../services/weather.dart';
import '../utilities/colors.dart';

class CitySearch extends StatefulWidget {
  const CitySearch({super.key, required this.weatherData, required this.city});

  final AllWeatherModel weatherData;
  final String city;

  @override
  State<CitySearch> createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  //WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    print('nnnnnnnnn');
    // updateUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: AppColors.blueGreyGradient,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.weatherData.name}, ${widget.weatherData.sys.country}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      WeatherModel()
                          .getWeatherIcon(id: widget.weatherData.id!.toInt()),
                      width: 250,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.weatherData.main.temp.toInt()}',
                          style: const TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.weatherData.weather[0].description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${widget.weatherData.main.tempMax.toInt()}',
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                const Text('Temp max',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '${widget.weatherData.main.tempMin.toInt()}',
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                const Text('Temp min',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '${widget.weatherData.wind.speed.toInt()}',
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                const Text(
                                  'Speed wind',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.all(34),
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '32',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                Text('Temp max',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '12',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                Text('Temp min',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '23',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                Text(
                                  'Speed wind',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
