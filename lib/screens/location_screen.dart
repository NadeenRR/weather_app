import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/services/weather.dart';
import '../model/all_weather_model.dart';
import '../services/featch_data.dart';
import '../services/networking.dart';
import '../utilities/colors.dart';
import '../utilities/constants.dart';
import '../widgets/my_outline_btn.dart';
import '../widgets/my_weather_widget.dart';
import '../widgets/search_field_widget.dart';
import 'city_search.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.weatherData});

  final AllWeatherModel weatherData;

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    print('bbbbbbbbbbb');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Weather',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MYOutlineBtn(
                      icon: Icons.location_on,
                      iconColor: Colors.black,
                      bColor: Colors.black.withOpacity(0.5),
                      function: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                SearchFieldWidget(
                  controller: controller,
                  onPressed: () {
                    getWeatherData();
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                MyWeatherWidget(
                  color: AppColors.blueGreyGradient,
                  image: WeatherModel()
                      .getWeatherIcon(id: widget.weatherData.id!.toInt()),
                  description: widget.weatherData.weather[0].description,
                  city: widget.weatherData.name,
                  country: widget.weatherData.sys.country,
                  speedWind: widget.weatherData.wind.speed.toInt(),
                  temp: widget.weatherData.main.temp.toInt(),
                  tempMax: widget.weatherData.main.tempMax.toInt(),
                  tempMin: widget.weatherData.main.tempMin.toInt(),
                  main: widget.weatherData.weather[0].main,
                  //  iconCode: iconCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getWeatherData() async {
    FeatchData featchData = FeatchData();
    AllWeatherModel weatherModel =
        await featchData.getCityLocationWeather(controller.text);

    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CitySearch(
          weatherData: weatherModel,
          city: controller.text,
        );
      }));
    }
  }
}
