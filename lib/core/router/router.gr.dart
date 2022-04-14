// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../ui/pages/daily_forecast_page.dart' as _i1;
import '../../ui/pages/hourly_forecast_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DailyForecastRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DailyForecastPage());
    },
    HourlyForecastRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HourlyForecastPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(DailyForecastRoute.name, path: '/'),
        _i3.RouteConfig(HourlyForecastRoute.name, path: 'hourly-forecast')
      ];
}

/// generated route for
/// [_i1.DailyForecastPage]
class DailyForecastRoute extends _i3.PageRouteInfo<void> {
  const DailyForecastRoute() : super(DailyForecastRoute.name, path: '/');

  static const String name = 'DailyForecastRoute';
}

/// generated route for
/// [_i2.HourlyForecastPage]
class HourlyForecastRoute extends _i3.PageRouteInfo<void> {
  const HourlyForecastRoute()
      : super(HourlyForecastRoute.name, path: 'hourly-forecast');

  static const String name = 'HourlyForecastRoute';
}
