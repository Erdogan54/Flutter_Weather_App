// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:flutter_weather_app/locator.dart';

class SearchListCubit extends Cubit<SearchListState> {
  SearchListCubit() : super(const NewSearchListState(yeniListe: []));

  List<String> searchList = [];

  final WeatherRepository _weatherRepository = getIt<WeatherRepository>();

  Future<List<String>> getDataList() async {
    try {
      searchList = await _weatherRepository.db.getDataPref();
   
      emit(NewSearchListState(yeniListe: searchList));
      return searchList;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  setList({required List<String> yeniList}) async {
    try {
      emit(NewSearchListState(yeniListe: yeniList));
      searchList = yeniList;
      _weatherRepository.db.setListPref(yeniList: yeniList);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  clickItem(int index) async {
    try {
      if (searchList.isEmpty) {
        searchList = await getDataList();
      } else {
        String item = searchList[index];
        searchList.removeAt(index);
        searchList.insert(0, item);
        setList(yeniList: searchList);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  removeItem(int index) async {
    try {
      if (searchList.length >= index + 1) {
        searchList.removeAt(index);
        setList(yeniList: searchList);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  setItem(String item) async {
  
    try {
      if (searchList.contains(item) == false) {
      ;
        searchList.insert(0, item);
        setList(yeniList: searchList);
       
      } else {
        searchList.remove(item);
        searchList.insert(0, item);
        
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
     
    }
   
  }
}

abstract class SearchListState extends Equatable {
  const SearchListState();

  @override
  List<Object> get props => [];
}

class NewSearchListState extends SearchListState {
  final List<String> yeniListe;
  const NewSearchListState({
    required this.yeniListe,
  });

  @override
  List<Object> get props => [yeniListe];
}
