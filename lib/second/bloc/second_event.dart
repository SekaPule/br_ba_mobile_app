part of 'second_bloc.dart';

@immutable
abstract class SecondEvent {}

class InitialSecond extends SecondEvent {}

class LoadSecond extends SecondEvent {
  final AllCharacters futureCharacter;

  LoadSecond(this.futureCharacter);
}
