import 'package:intl/intl.dart';

class ForecastHourModel {
  final String _time;
  String get time => _time;

  final double _feelsLike;
  double get feelsLike => _feelsLike;

  final double _temperature;
  double get temperature => _temperature;

  final String _condition;
  String get condition => _condition;

  final String _iconURL;
  String get iconURL => _iconURL;

  ForecastHourModel(
    String time,
    double feelsLike,
    double temperature,
    String condition,
    String iconURL,
  )   : _time = time,
        _feelsLike = feelsLike,
        _temperature = temperature,
        _condition = condition,
        _iconURL = iconURL;

  ForecastHourModel.fromJson(Map<String, dynamic> json)
      : _time = DateFormat.jm().format(
          DateTime.parse(json['time']),
        ),
        _feelsLike = json['feelslike_c'],
        _temperature = json['temp_c'],
        _condition = json['condition']['text'],
        _iconURL = 'http:' + json['condition']['icon'];
}
