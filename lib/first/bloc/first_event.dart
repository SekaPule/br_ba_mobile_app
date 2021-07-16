part of 'first_bloc.dart';

@immutable
abstract class FirstEvent {}

class InitialFirst extends FirstEvent {}

class LoadFirst extends FirstEvent {
  final String name;

  LoadFirst(this.name);
}
