import 'package:flutter/material.dart';
import 'package:visma_homework/core/models/forecast_hour_model.dart';

class HourlyForecastCard extends StatelessWidget {
  final ForecastHourModel forecastHourModel;
  const HourlyForecastCard({
    required this.forecastHourModel,
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
          child: ListTile(
            title: Text(forecastHourModel.time),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'temp: ' + forecastHourModel.temperature.toString() + '°C',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.white70),
                ),
                const SizedBox(width: 15),
                Text(
                  'feel: ' + forecastHourModel.feelsLike.toString() + '°C',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.white70),
                ),
              ],
            ),
            trailing: Image.network(forecastHourModel.iconURL),
          ),
        ),
      );
}
