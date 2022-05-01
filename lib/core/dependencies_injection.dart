import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visma_homework/core/controllers/forecast_controller.dart';
import 'package:visma_homework/core/helpers/http_client_helper.dart';

void injectDependencies() {
  final forecastController = ForecastController();
  Get.put(forecastController);

  final globalKey = GlobalKey<ScaffoldMessengerState>(
      debugLabel: 'ScaffoldMessengerGlobalKey');
  Get.put(globalKey, tag: 'ScaffoldMessengerGlobalKey');

  final httpClientHelper = HttpClientHelper();
  Get.put(httpClientHelper);
}
