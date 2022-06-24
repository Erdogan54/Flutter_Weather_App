import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


part 'tema_event.dart';
part 'tema_state.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  TemaBloc()
      : super(
            UygulamaTemasi(themeData: ThemeData.light(), color: Colors.blue)) {
    on<TemaDegistirEvent>((event, emit) {
     

      switch (event.durumKodu) {
        case 1000:
          emit(UygulamaTemasi(
              themeData: ThemeData(
                primarySwatch: Colors.amber,
                //canvasColor: Colors.amber.shade200,
              ),
              color: Colors.amber));
          break;
        case 1003:
          emit(UygulamaTemasi(
              themeData: ThemeData(
                primarySwatch: Colors.cyan,
                // canvasColor: Colors.grey,
              ),
              color: Colors.cyan));
          break;
        case 1240:
          emit(UygulamaTemasi(
              themeData: ThemeData(
                primarySwatch: Colors.blue,
                //  canvasColor: Colors.blueGrey,
              ),
              color: Colors.blue));
          break;
        case 1063:
          emit(UygulamaTemasi(
              themeData: ThemeData(
                primarySwatch: Colors.lightGreen,
                // canvasColor: Colors.lightGreen,
              ),
              color: Colors.lightGreen));
          break;
        case 1030:
        case 1183:
          emit(UygulamaTemasi(
              themeData: ThemeData(
                primarySwatch: Colors.indigo,
                // canvasColor: Colors.brown,
              ),
              color: Colors.indigo));
          break;
      }
    });
  }
}
