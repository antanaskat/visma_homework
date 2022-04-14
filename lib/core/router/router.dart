import 'package:auto_route/auto_route.dart';
import 'package:visma_homework/ui/pages/daily_forecast_page.dart';
import 'package:visma_homework/ui/pages/hourly_forecast_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: DailyForecastPage, initial: true),
    AutoRoute(page: HourlyForecastPage, path: HourlyForecastPage.routeID),
  ],
)
class $AppRouter {}
