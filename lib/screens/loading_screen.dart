import 'package:flutter/material.dart';
import 'package:weather_app/model/all_weather_model.dart';
import 'package:weather_app/services/weather.dart';

import '../services/featch_data.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  //  if (mounted) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       return LocationScreen(
  //         weatherData: weatherInfo,
  //       );
  //     }));
  //   }

  void getWeatherData() async {
    FeatchData featchData = FeatchData();
    AllWeatherModel weatherModel = await featchData.getCurrentLocationWeather();
   // WeatherModel weatherInfo = WeatherModel();
    // await weatherInfo.getCurrentLocationWeather();

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
    // getCurrentLocation();
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: const CircularProgressIndicator(),
            //      ElevatedButton(
            //   child: Text('get'),
            //   onPressed: () async {
            //     try {
            //       final p = await _determinePosition();
            //       print(p);
            //     } catch (e) {
            //       print(e);
            //     }
            //   },
            // ),
            // CustomPaint(
            //   size: const Size(300, 200),
            //   painter: MyPainter(),
            // ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  //final double borderRadius;

  final Paint _borderpaint = Paint()
    ..color = Colors.grey.shade300
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  final Paint _paint = Paint()
    ..color = Colors.white
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..strokeJoin = StrokeJoin.round;

  //MyPainter(this.borderRadius);

  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width;
    double y = size.height;
    double arc = 25;
    double yFactore = y * 0.4;
    double xFactore = x * 0.5;
    var path = Path();
    path.moveTo(arc, 0);
    path.lineTo((xFactore) - arc, 0);
    path.quadraticBezierTo(xFactore, 0, xFactore, arc);
    path.lineTo(xFactore, yFactore - arc);
    path.quadraticBezierTo(xFactore, yFactore, xFactore + arc, yFactore);
    path.lineTo(x - arc, yFactore);
    path.quadraticBezierTo(x, yFactore, x, yFactore + arc);
    path.lineTo(x, y - arc);
    path.quadraticBezierTo(x, y, x - arc, y);
    path.lineTo(arc, y);
    path.quadraticBezierTo(0, y, 0, y - arc);
    path.lineTo(0, arc);
    path.quadraticBezierTo(0, 0, arc, 0);

    canvas.drawPath(path, _paint);
    canvas.drawPath(path, _borderpaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw true;
  }
}
