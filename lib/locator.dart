import 'package:flutter_weather_app/data/local_db.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';

import 'package:flutter_weather_app/service/weather_api_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepository());
  getIt.registerLazySingleton<WeatherApiClient>(() => WeatherApiClient());
  getIt.registerLazySingleton<LocalDatabaseSharedPref>(
      () => LocalDatabaseSharedPref());
}
