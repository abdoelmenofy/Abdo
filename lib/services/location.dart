import 'package:geolocator/geolocator.dart';

class Location {
  var longitude;
  var latitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude  = position.latitude;
    } on Exception catch (e) {
      print('Can not Get Location');
    }
  }
}
