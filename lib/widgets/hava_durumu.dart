import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc_weather/weather_bloc.dart';

class HavaDurumu extends StatelessWidget {
  final String url;
  const HavaDurumu({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, state) {
        String sicaklik = (state as WeatherLoadedState)
                .weatherModel
                .current
                ?.tempC
                .toString() ??
            "";
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " $sicaklik°C",
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Image.network(
              "https:$url",
              fit: BoxFit.contain,
              height: 100,
              width: 100,
            ),
          ],
        );
      },
    );
  }
}
