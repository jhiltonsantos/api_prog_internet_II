import 'package:geolocator/geolocator.dart';

class Location {
  double currentLatitude;
  double currentLongitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
    } catch (exception) {
      print(exception);
    }
  }
}
