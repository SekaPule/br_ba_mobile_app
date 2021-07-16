import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brba/api/api.dart';
import 'package:brba/models/apiModel.dart';
import 'package:meta/meta.dart';

part 'first_event.dart';
part 'first_state.dart';

class FirstBloc extends Bloc<FirstEvent, FirstState> {
  FirstBloc() : super(FirstInitial());
  late List<AllCharacters> _allcharacters;
  late List<AllCharacters> _searchCharacters;

  @override
  Stream<FirstState> mapEventToState(
    FirstEvent event,
  ) async* {
    if (event is InitialFirst) {
      yield FirstInitial();

      _allcharacters = await fetchAllCharacters();
      yield FirstLoaded(_allcharacters);
    }

    if (event is LoadFirst) {
      _searchCharacters = await fecthCharactersByName(event.name);
      yield FirstLoadedByName(_searchCharacters);
    }
  }
}
