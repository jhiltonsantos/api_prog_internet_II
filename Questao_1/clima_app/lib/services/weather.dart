import 'package:climaapp/services/networking.dart';
import 'package:climaapp/services/location.dart';
import 'package:climaapp/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var urlCityName = '$openWeatherMap?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(urlCityName);
    return (await networkHelper.getData());
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMap?lat=${location.currentLatitude}&lon=${location.currentLongitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'É hora do 🍦 \n';
    } else if (temp > 20) {
      return 'Hora de shorts e 👕';
    } else if (temp < 10) {
      return 'Você precisará de 🧣 e 🧤';
    } else {
      return 'No caso, traga um 🧥  ';
    }
  }
}
