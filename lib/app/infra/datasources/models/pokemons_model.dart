import 'dart:convert';

import '../../../domain/entities/pokemons.dart';

class PokemonsModel extends Pokemons {
  final String name;
  final String url;

  PokemonsModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory PokemonsModel.fromMap(Map<String, dynamic> map) {
    return PokemonsModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonsModel.fromJson(String source) =>
      PokemonsModel.fromMap(json.decode(source));
}
