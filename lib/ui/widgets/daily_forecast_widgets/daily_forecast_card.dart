import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visma_homework/core/controllers/forecast_controller.dart';
import 'package:visma_homework/core/models/forecast_day_model.dart';

class DailyForecastCard extends StatelessWidget {
  final ForecastDayModel forecastDayModel;
  const DailyForecastCard({
    required this.forecastDayModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Material(
          elevation: 8.0,
          shape: Theme.of(context).listTileTheme.shape,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () async => await Get.find<ForecastController>()
                .navigateToDetails(forecastDayModel),
            child: ListTile(
              title: Text(forecastDayModel.date),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_downward,
                    size: 14,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    forecastDayModel.minTempC.toString() + '°C',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.white70),
                  ),
                  const SizedBox(width: 15),
                  const Icon(
                    Icons.arrow_upward,
                    size: 14,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    forecastDayModel.maxTempC.toString() + '°C',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
              trailing: Image.network(forecastDayModel.iconURL),
            ),
          ),
        ),
      );
}
