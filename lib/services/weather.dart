import 'package:cilma_mussa/services/location.dart';
import 'package:cilma_mussa/services/networking.dart';

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
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int aCondition) {
    if (aCondition < 300) {
      return '๐ฉ';
    } else if (aCondition < 400) {
      return '๐ง';
    } else if (aCondition < 600) {
      return 'โ๏ธ';
    } else if (aCondition < 700) {
      return 'โ๏ธ';
    } else if (aCondition < 800) {
      return '๐ซ';
    } else if (aCondition == 800) {
      return 'โ๏ธ';
    } else if (aCondition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
