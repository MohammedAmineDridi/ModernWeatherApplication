import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

  const WEATHER_API_KEY = "17da706ee225d44c646e6cd0c72affbf";

  Future<Map<String, dynamic>> getWeatherData(Position position) async {
    final dio = Dio();
    final response = await dio.get("https://api.openweathermap.org/data/2.5/weather?lat="+position.latitude.toString()+"&lon="+position.longitude.toString()+"&appid="+WEATHER_API_KEY);
    print(response.data);
    return response.data;
  }
