import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../asset/configs/asset_config.dart';
import '../blocs/search_pokemon_bloc.dart';
import '../blocs/search_pokemon_event.dart';
import '../blocs/search_pokemon_state.dart';
import 'detail_pokemon_widget.dart';

class SearchPokemonWidget extends StatelessWidget {
  SearchPokemonWidget(this._searchPokemonBloc, {Key? key}) : super(key: key);

  final SearchPokemonBloc _searchPokemonBloc;

  final TextEditingController _pokemonName = TextEditingController();

  void _searchPokemon(String text) => _searchPokemonBloc.add(DoSearchPokemonEvent(text));

  Widget _verticalDivider() => const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _verticalDivider(),
            const Text('Type a pokémon name'),
            TextField(
              controller: _pokemonName,
              onChanged: _searchPokemon,
            ),
            _verticalDivider(),
            Center(
              child: BlocProvider(
                create: (_) => _searchPokemonBloc,
                child: BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
                  builder: (context, state) {
                    if (state is FailureSearchPokemonState) return Text((state).message);
                    if (state is SuccessSearchPokemonState) return DetailPokemonWidget((state).pokemonModel);
                    if (state is LoadingSearchPokemonState) return Image.asset(AssetConfig.pokeball, width: 128);
                    return Image.asset(AssetConfig.pokelogo, width: 256);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
