import 'package:http/http.dart' as http;

import '../model/all_weather_model.dart';

class NetworkHelper {
  final String url;

  NetworkHelper({
    required this.url,
  });

  Future<AllWeatherModel> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //   Map<String, dynamic> data = jsonDecode(response.body);
      print(response.body);
      print('doneeeeeeeee');
      AllWeatherModel jsonDecode = allWeatherModelFromJson(response.body);
      return jsonDecode;
    }
    return Future.error('Error');
  }

}
