import '../core/helpers/geolocator.dart';
import '../network_layer/weather_API.dart';
import 'package:geolocator/geolocator.dart';
import '../data_layer/model.dart';
import '../core/helpers/helpers.dart';

// ------------ get weather data = fct (gps current position 'lat & long')

  fetchWeather() async {
  final LocationService locationService = LocationService();
  Position? currentPosition = await locationService.getCurrentLocation();
  Map<String,dynamic> weatherData = await getWeatherData(currentPosition!);
  String countryAreaName = weatherData['name']+", "+weatherData['sys']['country'];
  int conditionCode = weatherData['cod'];
  double currentTemperature = weatherData['main']['temp'];
  double temperatureMin = weatherData['main']['temp_min'];
  double temperatureMax = weatherData['main']['temp_max'];
  String main = weatherData['weather'][0]['main'];
  String sunriseTime = getSunTimeDateFormat(weatherData['sys']['sunrise']) ;
  String sunsetTime = getSunTimeDateFormat(weatherData['sys']['sunset']) ;
  Weather weather = Weather(countryAreaName: countryAreaName, conditionCode: conditionCode, currentTemperature: currentTemperature, temperatureMin: temperatureMin, temperatureMax: temperatureMax, main: main,sunriseTime:sunriseTime,sunsetTime: sunsetTime );
  return weather;
}
