import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visma_homework/core/controllers/forecast_controller.dart';
import 'package:visma_homework/core/models/forecast_day_model.dart';
import 'package:visma_homework/ui/widgets/daily_forecast_widgets/daily_forecast_list.dart';

class DailyForecastBody extends StatelessWidget {
  const DailyForecastBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<ForecastController>(
        id: 'DailyForecastBody',
        init: Get.find<ForecastController>(),
        builder: (forecastController) => RefreshIndicator(
          onRefresh: forecastController.refreshAPIData,
          child: FutureBuilder<List<ForecastDayModel>?>(
              future: forecastController.retrieveAPIDataList(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: Text('Check your internet connection'),
                    );

                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data == null) {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    }

                    return DailyForecastList(dailyForecastList: snapshot.data!);
                }
              }),
        ),
      );
}
