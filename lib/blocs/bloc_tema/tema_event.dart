part of 'tema_bloc.dart';

@immutable
abstract class TemaEvent  extends Equatable{}

class TemaDegistirEvent extends TemaEvent {
  final int durumKodu;

  TemaDegistirEvent(this.durumKodu);
  
  @override
  // TODO: implement props
  List<Object?> get props => [durumKodu];
}
