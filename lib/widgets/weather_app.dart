import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/bloc_tema/tema_bloc.dart';
import 'package:flutter_weather_app/blocs/bloc_weather/weather_bloc.dart';
import 'package:flutter_weather_app/blocs/cubit_search/search_list_cubit.dart';
import 'package:flutter_weather_app/widgets/hava_durumu.dart';
import 'package:flutter_weather_app/widgets/linear_color_widget.dart';
import 'package:flutter_weather_app/widgets/location.dart';
import 'package:flutter_weather_app/widgets/sehir_sec.dart';
import 'package:flutter_weather_app/widgets/son_guncelleme.dart';
import '../main.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    if (appInit == 0) {
      initData(context);

      appInit++;
    }

    print(
        "weather appden alınan list: ${context.read<SearchListCubit>().searchList}");

    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: weatherBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state is WeatherLoadingState
                ? const Text("Yükleniyor...")
                : const Text("Weather App"),
            actions: [
              IconButton(
                  onPressed: () async {
                    context.read<SearchListCubit>().getDataList();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SehirSecWidget()));
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: Builder(
            builder: (context) {
              if (state is WeatherInitialState) {
                return const LinearContainer(
                    child: Center(
                        child: Text(
                  "Şehir seçiniz",
                  style: TextStyle(fontSize: 36),
                )));
              }
              if (state is WeatherLoadingState) {
                return const LinearContainer(
                  child:  Center(
                    child: CircularProgressIndicator(color: Colors.white,),
                  ),
                );
              }
              if (state is WeatherLoadedState) {
                final model = state.weatherModel;
                print(model);

                context.read<SearchListCubit>().setItem(model.location!.name!);

                context.read<TemaBloc>().add(
                    TemaDegistirEvent(model.current?.condition?.code ?? 0));

                return LinearContainer(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      weatherBloc.add(RefreshWeatherEvent(
                          sehirAdi: model.location?.name ?? "ankara"));
                    },
                    child: ListView(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: LocationWidget(
                              sehir: model.location?.name ?? "null",
                            )),
                        const SizedBox(height: 15),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: SonGuncelleme(
                                sonGuncelleme:
                                    model.current?.lastUpdated ?? "null")),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: HavaDurumu(
                              url: model.current?.condition?.icon ?? ""),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state is WeatherErrorState) {
                return Center(
                    child: Text(state.errorMesage ??
                        "WeatherErrorState: Bir hata oluştu"));
              }
              return const Center(
                child: Text("Durum bilgisi alınamadı"),
              );
            },
          ),
        );
      },
    );
  }

  initData(BuildContext context) {
    context.read<SearchListCubit>().getDataList();
    print("getDataList calıstı");

    context.read<WeatherBloc>().add(const InitialWeatherEvent());
    print("InitialWeatherEvent calıstı");
  }
}
