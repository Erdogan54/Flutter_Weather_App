import 'package:flutter_weather_app/data/local_db.dart';
import 'package:flutter_weather_app/locator.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/service/weather_api_client.dart';

class WeatherRepository {
  WeatherApiClient apiClient = getIt<WeatherApiClient>();

  Future<WeatherModel?> getWeather({required String sehir}) async {
    return await apiClient.getWeatherData(sehirAdi: sehir);
  }

  LocalDatabaseSharedPref db = getIt<LocalDatabaseSharedPref>();

  /* Future<List<String>> getInitDb() async {
    return await db.initShared();
  } */

  /* saveSharedDb({required String yeniDeger}) {
    db.saveShared(yeniDeger: yeniDeger);
  } */

  /* Future<List<String>> removeAtDb(int index) async {
    return await db.removeSearch(index);
  } */

  /* Future<List<String>> clickSearchDb(int index) async {
    return await db.clickSearch(index);
  } */
}
