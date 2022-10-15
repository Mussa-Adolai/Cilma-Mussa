import 'package:cilma_mussa/services/location.dart';
import 'package:cilma_mussa/services/networking.dart';
import 'package:geolocator/geolocator.dart';

const apiKey = 'ca22c53dc6c5f364e8e792c3f4281327';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWheather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var wheatherData = await networkHelper.getData();
    return wheatherData;
  }

  Future<dynamic> getLocationWeather() async {
    //LocationPermission permission = await Geolocator.requestPermission();
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int aCondition) {
    if (aCondition < 300) {
      return '🌩';
    } else if (aCondition < 400) {
      return '🌧';
    } else if (aCondition < 600) {
      return '☔️';
    } else if (aCondition < 700) {
      return '☃️';
    } else if (aCondition < 800) {
      return '🌫';
    } else if (aCondition == 800) {
      return '☀️';
    } else if (aCondition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
