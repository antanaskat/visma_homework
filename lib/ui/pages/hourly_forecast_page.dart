import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visma_homework/core/controllers/forecast_controller.dart';
import 'package:visma_homework/ui/widgets/hourly_forecast_widgets/hourly_forecast_list.dart';

class HourlyForecastPage extends StatelessWidget {
  static const String routeID = 'hourly-forecast';

  const HourlyForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.find<ForecastController>().currentForecastModel.date,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: const HourlyForecastList(),
    );
  }
}
