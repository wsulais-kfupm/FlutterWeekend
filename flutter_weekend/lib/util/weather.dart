import 'package:flutter_weekend/misc/networking.dart';
import 'package:flutter_weekend/util/location.dart';
import 'package:geolocator/geolocator.dart';

// import 'package:location/location.dart';
const apiKey = '6f0ca819077ae18faa0fabf52ea71ae0';
const url = 'https://api.openweathermap.org/data/2.5/weather';
Future<dynamic> getLocationWeather() async {
  Location location = Location();
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  await location.getCurrentLocation();
  NetworkHelper networkHelper = NetworkHelper(
      '$url?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
  return await networkHelper.getData();
}
