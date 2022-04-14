import 'package:visma_homework/core/models/forecast_hour_model.dart';
import 'package:intl/intl.dart';

class ForecastDayModel {
  final String _date;
  String get date => _date;

  final double _minTempC;
  double get minTempC => _minTempC;

  final double _maxTempC;
  double get maxTempC => _maxTempC;

  final bool _snow;
  bool get snow => _snow;

  final bool _rain;
  bool get rain => _rain;

  final List<ForecastHourModel> _forecastHour;
  List<ForecastHourModel> get forecastHour => _forecastHour;

  final String _condition;
  String get condition => _condition;

  final String _iconURL;
  String get iconURL => _iconURL;

  ForecastDayModel(
    String date,
    double minTempC,
    double maxTempC,
    bool rain,
    bool snow,
    List<ForecastHourModel> forecastHour,
    String condition,
    String iconURL,
  )   : _date = date,
        _minTempC = minTempC,
        _maxTempC = maxTempC,
        _rain = rain,
        _snow = snow,
        _forecastHour = forecastHour,
        _condition = condition,
        _iconURL = iconURL;

  ForecastDayModel.fromJson(Map<String, dynamic> json)
      : _date = DateFormat.MMMd().format(DateTime.parse(json['date'])),
        _minTempC = json['day']['mintemp_c'],
        _maxTempC = json['day']['maxtemp_c'],
        _rain = json['day']['daily_will_it_rain'] == 1 ? true : false,
        _snow = json['day']['daily_chance_of_snow'] == 1 ? true : false,
        _forecastHour = List<Map<String, dynamic>>.from(json['hour'])
            .map(
              (hourJson) => ForecastHourModel.fromJson(hourJson),
            )
            .toList(),
        _condition = json['day']['condition']['text'],
        _iconURL = 'http:' + json['day']['condition']['icon'];
}
