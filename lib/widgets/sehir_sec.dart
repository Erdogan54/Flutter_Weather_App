import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:flutter_weather_app/locator.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/widgets/linear_color_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/bloc_weather/weather_bloc.dart';
import '../blocs/cubit_search/search_list_cubit.dart';

class SehirSecWidget extends StatefulWidget {
  const SehirSecWidget({Key? key}) : super(key: key);

  @override
  State<SehirSecWidget> createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherBlocB = BlocProvider.of<WeatherBloc>(context);
    context.read<SearchListCubit>().getDataList();

    return Scaffold(
      appBar: AppBar(
          title: const Text("Şehir seç"), automaticallyImplyLeading: false),
      body: LinearContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                            hintText: "Şehir seçiniz",
                            labelText: "Şehir",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: BlocBuilder<WeatherBloc, WeatherState>(
                          bloc: weatherBlocB,
                          builder: (context, state) {
                            return IconButton(
                                onPressed: () {
                                  Navigator.pop(context);

                                  if (_textEditingController.text.isNotEmpty) {
                                    context.read<WeatherBloc>().add(
                                        FetchWeatherEvent(
                                            istekSehirAdi:
                                                _textEditingController.text));
                                  }
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.blueAccent,
                                  size: 30,
                                ));
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: context.watch<SearchListCubit>().searchList.length,
                  itemBuilder: (context, index) {
                    String sehir =
                        context.watch<SearchListCubit>().searchList[index];
                    return InkWell(
                      onLongPress: () {
                        context.read<SearchListCubit>().removeItem(index);
                        // setState(() {});
                      },
                      onTap: () {
                        Navigator.pop(context, sehir);

                        context
                            .read<WeatherBloc>()
                            .add(FetchWeatherEvent(istekSehirAdi: sehir));

                        context.read<SearchListCubit>().clickItem(index);
                        // setState(() {});
                      },
                      child: ListTile(
                        title: Text(sehir),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
