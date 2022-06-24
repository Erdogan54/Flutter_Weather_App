part of 'tema_bloc.dart';

@immutable
abstract class TemaState extends Equatable{}

class UygulamaTemasi extends TemaState {
  final ThemeData themeData;
  final MaterialColor color;

  UygulamaTemasi({required this.themeData, required this.color});
  
  @override
  // TODO: implement props
  List<Object?> get props => [themeData,color];
}
