import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../pokemon/blocs/search_pokemon_bloc.dart';
import '../../pokemon/widgets/search_pokemon_widget.dart';
import '../../theme/configs/theme_config.dart';
import '../configs/app_config.dart';

class AppPage extends StatelessWidget {
  AppPage({Key? key}) : super(key: key);

  final _searchPokemonBloc = Modular.get<SearchPokemonBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ThemeConfig.backgroundColor),
      appBar: AppBar(
        title: const Text(AppConfig.title),
      ),
      body: SearchPokemonWidget(_searchPokemonBloc),
    );
  }
}
