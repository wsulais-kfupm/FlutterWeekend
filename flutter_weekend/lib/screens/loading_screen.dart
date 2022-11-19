// ignore_for_file: prefer_const_constructors, constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weekend/util/location.dart';
import 'package:geolocator/geolocator.dart';

// const url = 'https://api.openweathermap.org/data/2.5/weather';
// String _locationEnv = dotenv.env['LOCATION_TOKEN']!;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getCurrentLocation() async {
    Location location = Location();
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    await location.getCurrentLocation();
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
