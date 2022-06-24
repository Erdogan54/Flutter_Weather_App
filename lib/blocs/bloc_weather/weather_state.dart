part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitialState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class WeatherLoadingState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  const WeatherLoadedState({required this.weatherModel});

  @override
  // TODO: implement props
  List<Object?> get props => [weatherModel];
}

class WeatherErrorState extends WeatherState {
  final String? errorMesage;

  const WeatherErrorState(this.errorMesage);
  @override
  // TODO: implement props
  List<Object?> get props => [errorMesage];
}
