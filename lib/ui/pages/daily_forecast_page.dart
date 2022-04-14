import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visma_homework/core/controllers/forecast_controller.dart';
import 'package:visma_homework/ui/widgets/daily_forecast_widgets/daily_forecast_body.dart';
import 'dart:io' show Platform;

class DailyForecastPage extends StatelessWidget {
  const DailyForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: Platform.isIOS,
          title: GetX<ForecastController>(
            init: Get.find<ForecastController>(),
            builder: (forecastController) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  forecastController.cityName.value,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  ', ' + forecastController.countryName.value,
                  style: const TextStyle(color: Colors.black45),
                ),
              ],
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: const DailyForecastBody(),
      );
}
