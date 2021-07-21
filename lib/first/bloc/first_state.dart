part of 'first_bloc.dart';

@immutable
abstract class FirstState {}

class FirstInitial extends FirstState {}

class FirstLoaded extends FirstState {
  final List<AllCharacters> allcharacters;

  FirstLoaded(this.allcharacters);
}

class LoadingError extends FirstState {
  final Exception exception;

  LoadingError(this.exception);
}
