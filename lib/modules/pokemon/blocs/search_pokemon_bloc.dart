import 'package:bloc/bloc.dart';
import 'package:dart_pokemon_core/dart_pokemon_core.dart';
import 'package:rxdart/rxdart.dart';

import '../models/pokemon_model.dart';
import 'search_pokemon_event.dart';
import 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  SearchPokemonBloc(this._findPokemonUseCase) : super(DefaultSearchPokemonState()) {
    on<DoSearchPokemonEvent>(
      _searchPokemon,
      transformer: debounce<DoSearchPokemonEvent>,
    );
  }

  final IFindPokemonUseCase _findPokemonUseCase;

  void _searchPokemon(DoSearchPokemonEvent event, Emitter<SearchPokemonState> emitter) async {
    if (event.pokemonName.isEmpty) {
      emitter(DefaultSearchPokemonState());
      return;
    }
    emitter(LoadingSearchPokemonState());
    await Future.delayed(const Duration(seconds: 2));
    final pokemon = await _findPokemonUseCase.execute(FindPokemonInput(name: event.pokemonName));
    if (pokemon.status == 'failure') emitter(FailureSearchPokemonState(pokemon.message));
    if (pokemon.status == 'success') emitter(SuccessSearchPokemonState(PokemonModel.fromMap(pokemon.output)));
  }

  Stream<T> debounce<T>(Stream<T> events, Stream<T> Function(T) transformer) {
    return events.debounceTime(const Duration(milliseconds: 300)).switchMap(transformer);
  }
}
