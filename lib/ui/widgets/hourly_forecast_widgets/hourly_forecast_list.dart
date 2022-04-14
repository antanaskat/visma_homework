import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visma_homework/core/controllers/forecast_controller.dart';
import 'package:visma_homework/ui/widgets/hourly_forecast_widgets/hourly_forecast_card.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecastController = Get.find<ForecastController>();
    return SafeArea(
      child: ListView.builder(
        itemCount: forecastController.currentForecastModel.forecastHour.length,
        itemBuilder: (context, index) => HourlyForecastCard(
          forecastHourModel:
              forecastController.currentForecastModel.forecastHour[index],
        ),
      ),
    );
  }
}
