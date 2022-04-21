abstract class SearchPokemonEvent {}

class DoSearchPokemonEvent extends SearchPokemonEvent {
  DoSearchPokemonEvent(this.pokemonName);

  final String pokemonName;
}
