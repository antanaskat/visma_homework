import 'dart:convert';

import 'package:visma_homework/core/models/forecast_day_model.dart';

class JsonToModel {
  final String json;

  JsonToModel({required this.json});

  List<ForecastDayModel> convert() {
    final decodedJson = jsonDecode(json) as Map<String, dynamic>;
    final jsonList =
        List<Map<String, dynamic>>.from(decodedJson['forecast']['forecastday']);
    final dayForecastList =
        jsonList.map((dayJson) => ForecastDayModel.fromJson(dayJson)).toList();
    return dayForecastList;
  }

  String cityName() {
    final decodedJson = jsonDecode(json) as Map<String, dynamic>;
    final name = decodedJson['location']['name'];
    return name;
  }

  String countryName() {
    final decodedJson = jsonDecode(json) as Map<String, dynamic>;
    final name = decodedJson['location']['country'];
    return name;
  }
}
