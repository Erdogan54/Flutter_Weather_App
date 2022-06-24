import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_weather_app/models/weather_model.dart';

import '../locator.dart';

class WeatherApiClient {
  static const _baseUrl =
      "https://api.weatherapi.com/v1/current.json?key=b801a75e6c8145929d3210732221706";

  Future<WeatherModel?> getWeatherData({required String sehirAdi}) async {
    WeatherModel model = WeatherModel();

    try {
      Map<String, String> query = {"q": sehirAdi};
      Response<dynamic> result =
          await Dio().get(_baseUrl, queryParameters: query);

      if (result.statusCode == 200) {
        debugPrint("status code=200");
        if (result.data != null) {
          debugPrint("result hasData");
          Map<String, dynamic> data = result.data!;
          model = WeatherModel.fromJson(data);
          return model;
        } 
      } 
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }
}


//"https://api.weatherapi.com/v1/current.json?key=b801a75e6c8145929d3210732221706&q=istanbul&aqi=yes"