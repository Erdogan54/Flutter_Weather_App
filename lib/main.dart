import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/bloc_tema/tema_bloc.dart';
import 'package:flutter_weather_app/locator.dart';
import 'package:flutter_weather_app/widgets/weather_app.dart';

import 'blocs/bloc_weather/weather_bloc.dart';
import 'blocs/cubit_search/search_list_cubit.dart';

int appInit = 0;
void main() {
  setup();

  runApp(
    BlocProvider(
      create: (context) => TemaBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchListCubit>(
          create: (context) => SearchListCubit(),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
        )
      ],
      child: BlocBuilder<TemaBloc, TemaState>(
        bloc: BlocProvider.of<TemaBloc>(context),
        builder: (context, state) {
          debugPrint("materialApp state ${state.props}");

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            theme: state is UygulamaTemasi ? state.themeData : ThemeData.dark(),
            color: Colors.lightBlue,
            home: const WeatherApp(),
          );
        },
      ),
    );
  }
}
