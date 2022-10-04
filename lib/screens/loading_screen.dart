// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cilma_mussa/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('longitude :${location.longitude}');
    print('latitude :${location.latitude}');
  }

  late final String url =
      'http://api.openweathermap.org/geo/1.0/zip?zip=E14,GB&appid=ca22c53dc6c5f364e8e792c3f4281327';
//
  void getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('state ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
