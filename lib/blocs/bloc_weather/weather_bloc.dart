// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

import '../../locator.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository = getIt<WeatherRepository>();

  WeatherBloc() : super(WeatherInitialState()) {
    on<InitialWeatherEvent>((event, emit) async {
      List searchList = await _weatherRepository.db.getDataPref();
      if (searchList.isNotEmpty) {
        await verileriGetirVeYayinla(searchList[0], emit);
      } else {
        emit(WeatherInitialState());
      }
    });

    on<RefreshWeatherEvent>((event, emit) async {
      await verileriGetirVeYayinla(event.sehirAdi, emit);
    });

    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      await verileriGetirVeYayinla(event.istekSehirAdi, emit);
    });
  }

  Future<void> verileriGetirVeYayinla(
      String sehirAdi, Emitter<WeatherState> emit) async {
    try {
      WeatherModel? model =
          await _weatherRepository.getWeather(sehir: sehirAdi);

      if (model != null) {
        emit(WeatherLoadedState(weatherModel: model));
      } else {
        emit(const WeatherErrorState("veriler yüklenirken bir hata oluştu"));
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(WeatherErrorState("WeatherErrorState: $e"));
    }
  }
}
