import 'dart:io';

import 'package:get/instance_manager.dart';
import 'package:http/http.dart';

class HttpClientHelper {
  Client? client;
  final String _baseURL = 'https://api.weatherapi.com/v1/';

  HttpClientHelper({this.client}) {
    client = client ?? Client();
  }

  Future<Response> get({required String path}) async {
    try {
      final response = await client!.get(Uri.parse(_baseURL + path));

      if (response.statusCode == 200) {
        return response;
      } else {
        return Response('An error has occurred', response.statusCode);
      }
    } on SocketException {
      return Response('No internet connection', 400);
    } on HttpException {
      return Response("Couldn't find the data", 500);
    } on FormatException {
      return Response('Bad response format', 400);
    }
  }
}
