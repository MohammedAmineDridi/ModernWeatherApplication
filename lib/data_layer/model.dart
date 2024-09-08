class Weather{
  String countryAreaName;
  int conditionCode;
  double currentTemperature;
  double temperatureMin;
  double temperatureMax;
  String main;
  String sunriseTime;
  String sunsetTime;
  
  Weather({
    required this.countryAreaName,
    required this.conditionCode,
    required this.currentTemperature,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.main,
    required this.sunriseTime,
    required this.sunsetTime
  });

}