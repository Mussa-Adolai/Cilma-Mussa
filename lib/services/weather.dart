class WeatherModel {
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
