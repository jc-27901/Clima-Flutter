
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = 'efaaae21a013e376c7c441b5f4c8066a';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

Future<dynamic> getCityWeather (String cityName) async {
  var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
  NetworkHelper networkHelper = NetworkHelper(url);

  var weatherData =  await networkHelper.getData();
  return weatherData;
}

 Future<dynamic> getLocationWeather() async{
    double latitude;
    double longitude;
    Location location = Location();
    await location.getCurrentLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    print(location.longitude);
    print(location.latitude);

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

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
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need Sweater and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
