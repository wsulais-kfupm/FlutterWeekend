// https://api.mapbox.com/styles/v1/ja3far03/clamapeg9002414n7iwvvrw5o/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiamEzZmFyMDMiLCJhIjoiY2w3N3VtemlyMDJiajNxbzgzZXE4cTM1dSJ9.ItrD0mLRn-IDiywvQyLO1w

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_weekend/components/nav_bar.dart';
import 'package:flutter_weekend/util/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

String myEnv = dotenv.env['MAPBOX_TOKEN']!;
Location location = Location();

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  static const String id = 'map_screen';
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool loading = true;

  void getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    while (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.denied) {
        break;
      }
    }
    await location.getCurrentLocation();
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : FlutterMap(
              options: MapOptions(
                center: LatLng(location.latitude!, location.longitude!),
                zoom: 9.2,
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/ja3far03/clamapeg9002414n7iwvvrw5o/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiamEzZmFyMDMiLCJhIjoiY2w3N3VtemlyMDJiajNxbzgzZXE4cTM1dSJ9.ItrD0mLRn-IDiywvQyLO1w',
                  userAgentPackageName: 'com.example.app',
                  additionalOptions: {
                    'accessToken': myEnv,
                    'id': 'mapbox.mapbox-streets-v8'
                  },
                ),
              ],
            ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
