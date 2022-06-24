part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class InitialWeatherEvent extends WeatherEvent {
  const InitialWeatherEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final String istekSehirAdi;
  const FetchWeatherEvent({required this.istekSehirAdi});

  @override
  // TODO: implement props
  List<Object?> get props => [istekSehirAdi];
}

class RefreshWeatherEvent extends WeatherEvent {
  final String sehirAdi;
  const RefreshWeatherEvent({required this.sehirAdi});

  @override
  // TODO: implement props
  List<Object?> get props => [sehirAdi];
}
