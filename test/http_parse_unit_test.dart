import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:visma_homework/core/helpers/http_client_helper.dart';
import 'package:http/http.dart' as http;
import 'package:visma_homework/core/helpers/json_to_model.dart';
import 'package:visma_homework/core/models/forecast_day_model.dart';

void main() async {
  const testPath = 'test';
  const baseUrl = 'https://api.weatherapi.com/v1/';
  final fakeResponse =
      File('test/resources/fake_response.json').readAsStringSync();

  group('Http requests', () {
    test('GET forecast data success', () async {
      Future<http.Response> _mockRequest(http.Request request) async {
        if (request.url.toString().startsWith(baseUrl)) {
          return http.Response(
            fakeResponse,
            200,
          );
        }
        return http.Response('Error: Unkown endpoint', 404);
      }

      final clientHelper = HttpClientHelper(client: MockClient(_mockRequest));
      final response = await clientHelper.get(path: testPath);
      expect(response.body,
          File('test/resources/fake_response.json').readAsStringSync());
    });

    test('GET forecast data fail', () async {
      Future<http.Response> _mockRequest(http.Request request) async {
        if (request.url.toString().startsWith(baseUrl)) {
          return http.Response(
            "Couldn't find the data",
            500,
          );
        }
        return http.Response('Error: Unkown endpoint', 404);
      }

      final clientHelper = HttpClientHelper(client: MockClient(_mockRequest));
      final response = await clientHelper.get(path: testPath);

      expect(response.body, 'An error has occurred');
    });
  });

  group('Parsing', () {
    final jsonToModel = JsonToModel(json: fakeResponse);
    final List<ForecastDayModel> listOfModels = jsonToModel.convert();
    test('Parsing forecast day data', () {
      expect(listOfModels.length, 3);
      expect(listOfModels.first.date, 'May 1');
    });

    test('Parsing forecast hour data', () {
      final hourlyList = listOfModels.first.forecastHour;

      expect(hourlyList.length, 24);
      expect(hourlyList.first.time, '12:00 AM');
    });

    test('Parsing country name', () {
      final countryName = jsonToModel.countryName();

      expect(countryName, 'Lithuania');
    });

    test('Parsing city name', () {
      final cityName = jsonToModel.cityName();

      expect(cityName, 'Vilnius');
    });
  });
}
