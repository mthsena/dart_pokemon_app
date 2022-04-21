class PokemonModel {
  const PokemonModel(
    this.id,
    this.name,
    this._height,
    this._weight,
    this.types,
    this.image,
  );

  final int id;
  final String name;
  final double _height;
  final double _weight;
  final List<String> types;
  final String image;

  String get height => '$_height m.';
  String get weight => '$_weight kg.';

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      map['id'] ?? 0,
      map['name'] ?? '',
      map['height']?.toDouble() ?? 0.0,
      map['weight']?.toDouble() ?? 0.0,
      map['types'] ?? [],
      map['image'] ?? '',
    );
  }
}
