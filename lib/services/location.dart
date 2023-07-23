import 'package:geolocator/geolocator.dart';

class Location {
  late double lat;
  late double long;

  // Location({
  //   required this.lat,
  //   required this.long,
  // });

  Future<void> getCurrentLocation() async {
    try {
      Position position = await _determinePosition();
      lat = position.latitude;
      long = position.longitude;
    
    } catch (e) {
      print(e);
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    
    return await Geolocator.getCurrentPosition();
  }
}
