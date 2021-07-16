import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brba/models/apiModel.dart';
import 'package:meta/meta.dart';

part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  SecondBloc() : super(SecondInitial());

  @override
  Stream<SecondState> mapEventToState(
    SecondEvent event,
  ) async* {
    if (event is LoadSecond) {
      yield SecondInitial();
      yield SecondLoaded(event.futureCharacter);
    }
  }
}
