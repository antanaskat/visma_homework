import 'package:flutter/material.dart';
import 'package:visma_homework/core/models/forecast_day_model.dart';

import 'daily_forecast_card.dart';

class DailyForecastList extends StatelessWidget {
  final List<ForecastDayModel> dailyForecastList;
  const DailyForecastList({
    required this.dailyForecastList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        left: false,
        right: false,
        top: false,
        child: ListView.builder(
            itemCount: dailyForecastList.length,
            itemBuilder: (context, index) {
              final dataRow = dailyForecastList[index];
              return DailyForecastCard(
                forecastDayModel: dataRow,
              );
            }),
      );
}
