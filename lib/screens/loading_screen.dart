// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cilma_mussa/services/location.dart';
import 'package:cilma_mussa/services/networking.dart';

const apiKey = 'ca22c53dc6c5f364e8e792c3f4281327';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  double? longitude;
  double? latitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var wethetData = await networkHelper.getData();

    // var cond = decodrdData['weather'][0]['id'];
    // var temp = decodrdData['main']['temp'];
    // var cName = decodrdData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
