import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:visma_homework/core/helpers/http_client_helper.dart';
import 'package:visma_homework/core/helpers/json_to_model.dart';
import 'package:visma_homework/core/models/forecast_day_model.dart';
import 'package:visma_homework/core/router/router.gr.dart';

class ForecastController extends GetxController {
  final navigatorStateKey = Get.key;
  final _navigator = Get.find<AppRouter>();
  RxString cityName = RxString('City');
  RxString countryName = RxString('Country');
  late ForecastDayModel currentForecastModel;

  Future<List<ForecastDayModel>?> retrieveAPIDataList() async {
    const path =
        'forecast.json?key=5c7b2d2c68bd470c97772619221404&q=Vilnius&days=3&aqi=no&alerts=no';
    try {
      final response = await Get.find<HttpClientHelper>().get(path: path);

      if (response.statusCode == 200) {
        final jsonToModel = JsonToModel(json: response.body);
        final dayForecastList = jsonToModel.convert();

        cityName.value = jsonToModel.cityName();
        countryName.value = jsonToModel.countryName();

        return dayForecastList;
      } else {
        _showErrorDialog();

        return null;
      }
    } catch (error) {
      _showErrorDialog();
      return null;
    }
  }

  Future<void> refreshAPIData() async {
    update(['DailyForecastBody']);
  }

  Future<void> navigateToDetails(ForecastDayModel forecastDayModel) async {
    currentForecastModel = forecastDayModel;

    await _navigator.push(
      const HourlyForecastRoute(),
    );
  }

  void _showErrorDialog() {
    final navigatorState = navigatorStateKey.currentState;

    if (navigatorState == null || !navigatorState.mounted) {
      return;
    }

    final scaffoldMessengerState =
        ScaffoldMessenger.maybeOf(navigatorState.context);

    if (scaffoldMessengerState == null || !scaffoldMessengerState.mounted) {
      return;
    }

    scaffoldMessengerState.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: const <Widget>[
            Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 18,
            ),
            SizedBox(width: 20),
            Text(
              'Something went wrong',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
