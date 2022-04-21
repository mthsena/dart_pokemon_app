import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../models/pokemon_model.dart';

class DetailPokemonWidget extends StatelessWidget {
  const DetailPokemonWidget(this._pokemonModel, {Key? key}) : super(key: key);

  final PokemonModel _pokemonModel;

  Future<Color> _getImageColor(ImageProvider imageProvider) async {
    final palette = await PaletteGenerator.fromImageProvider(imageProvider);
    return palette.dominantColor?.color ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final id = '# ${_pokemonModel.id}';
    final name = _pokemonModel.name.toUpperCase();
    final type = 'Type: ${_pokemonModel.types.join(', ').toUpperCase()}';
    final height = 'Height: ${_pokemonModel.height}';
    final weight = 'Weight: ${_pokemonModel.weight}';
    return FutureBuilder<Color>(
      future: _getImageColor(NetworkImage(_pokemonModel.image)),
      builder: (context, snapshot) {
        return ListTile(
          style: ListTileStyle.drawer,
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            backgroundColor: snapshot.data,
            backgroundImage: NetworkImage(_pokemonModel.image),
          ),
          title: Text(
            name,
            style: TextStyle(
              color: snapshot.data,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(type),
              Text(height),
              Text(weight),
            ],
          ),
          trailing: Text(id),
        );
      },
    );
  }
}
