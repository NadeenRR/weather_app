import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:weather_app/screens/location_screen.dart';

import '../model/all_weather_model.dart';
import '../services/featch_data.dart';
import '../services/weather.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double percent = 0;
  WeatherModel weatherInfo = WeatherModel();

  getWeatherData() async {
    FeatchData featchData = FeatchData();
    AllWeatherModel weatherModel = await featchData.getCurrentLocationWeather();

    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          weatherData: weatherModel,
        );
      }));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  List<Color> color = const [
    Color(0xfffff06e),
    Color(0xd371d1f0),
    Color(0xa1d485f0),
    Color(0x0090ddff),
    Color(0x324981f0),
    Color(0x5609c5ef)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 1),
              colors: [
                Color(0xfffff06e),
                Color(0xd371d1f0),
                Color(0xa1d485f0),
                Color(0x0090ddff),
                Color(0x324981f0),
                Color(0x5609c5ef)
              ],
              stops: <double>[0, 0.464, 1, 1, 1, 1],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/group.png',
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Weather App',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold, height: 2),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Weather forecasts, and history in \na fast and elegant way\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularPercentIndicator(
                          animation: true,
                          animationDuration: 1000,
                          radius: 50,
                          lineWidth: 5,
                          percent: percent,
                          progressColor: const Color(0xd34981F0),
                          backgroundColor:
                              const Color(0xd34981F0).withOpacity(0.2),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Color(0xd34981F0),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 35,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                percent += 1;
                                if (percent == 1.0) {
                                  getWeatherData();
                                }
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
