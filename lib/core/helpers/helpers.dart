import 'package:intl/intl.dart';

// kelvin to celsius conversion
double fromkelvinToCelsius(double kelvinTemperature){
  return kelvinTemperature-273.15;
}

// convert Unix timestamps date to readable date format
String getSunTimeDateFormat(int dateTimestamp){ // for sunrise and sunset times
  DateTime newdateformat = DateTime.fromMillisecondsSinceEpoch(dateTimestamp * 1000, isUtc: true);
  String newdateformatFormatted = DateFormat('hh:mm a').format(newdateformat);
  print('formated date : $newdateformatFormatted');
  return newdateformatFormatted;
}
