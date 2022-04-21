import '../models/pokemon_model.dart';

abstract class SearchPokemonState {}

class DefaultSearchPokemonState extends SearchPokemonState {}

class LoadingSearchPokemonState extends SearchPokemonState {}

class FailureSearchPokemonState extends SearchPokemonState {
  FailureSearchPokemonState(this.message);

  final String message;
}

class SuccessSearchPokemonState extends SearchPokemonState {
  SuccessSearchPokemonState(this.pokemonModel);

  final PokemonModel pokemonModel;
}
