import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visma_homework/core/controllers/forecast_controller.dart';
import 'package:visma_homework/core/dependencies_injection.dart';
import 'package:visma_homework/core/router/router.gr.dart';
import 'package:visma_homework/ui/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MyHomePage();
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _appRouter = AppRouter(Get.key);

  @override
  void initState() {
    Get.put(_appRouter, permanent: true);
    injectDependencies();
    super.initState();
  }

  @override
  void dispose() {
    if (Get.isRegistered<ForecastController>()) {
      Get.delete<ForecastController>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        scaffoldMessengerKey: Get.find<GlobalKey<ScaffoldMessengerState>>(
            tag: 'ScaffoldMessengerGlobalKey'),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(initialDeepLink: '/'),
        theme: CustomTheme().themeData,
      );
}
