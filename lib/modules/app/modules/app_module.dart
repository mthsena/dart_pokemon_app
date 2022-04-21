import 'package:dart_pokemon_core/dart_pokemon_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../pokemon/blocs/search_pokemon_bloc.dart';
import '../pages/app_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => SearchPokemonBloc(
        FindPokemonUseCase(
          PokeApiPokemonRepository(),
        ),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => AppPage(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
