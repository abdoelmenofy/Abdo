import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getMobilePosistion() async {
    // Get Location [Long - Lat]
    Location location = new Location();
    await location.getLocation();
    print('location.latitude : ${location.latitude}');
    print('location.longitude : ${location.longitude}');
    // ------------------------------------------------------------

    // Get Json Weather Data
    NetworkHelber helber = new NetworkHelber(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=39030f332760d0e62543577d8d23480b');
    var jsonData = await helber.getData();
    print('jsonData : ${jsonData}');

    // Open Locatio_screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(jsonData);
        },
      ),
    );
  }

  @override
  void initState() {
    getMobilePosistion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      ),
    );
  }
}
