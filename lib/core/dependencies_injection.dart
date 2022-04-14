import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visma_homework/core/controllers/forecast_controller.dart';

void injectDependencies() {
  final forecastController = ForecastController();
  Get.put(forecastController);

  final globalKey = GlobalKey<ScaffoldMessengerState>(
      debugLabel: 'ScaffoldMessengerGlobalKey');
  Get.put(globalKey, tag: 'ScaffoldMessengerGlobalKey');
}
