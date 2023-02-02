import 'dart:convert';

import '../../domain/entities/pokemons_id.dart';

class PokemonsIdModel extends PokemonsId {
  final String? name;
  final String? svg;
  final String? frontFemale;
  final String? mainSkill;
  final String? species;
  final String? types;
  final int? weight;
  bool favorite;

  PokemonsIdModel({
    this.name,
    this.svg,
    this.frontFemale,
    this.mainSkill,
    this.species,
    this.types,
    this.weight,
    this.favorite = false,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'front_default': svg,
      'abilities': mainSkill,
      'species': species,
      'types': types,
      'weight': weight,
      'favorite': favorite,
    };

    if (frontFemale != null) {
      map['front_female'] = frontFemale;
    }

    return map;
  }

  factory PokemonsIdModel.fromMap(Map<String, dynamic> map) {
    return PokemonsIdModel(
      name: map['name'] ?? '',
      svg: map['sprites']['other']['dream_world']['front_default'] ?? '',
      frontFemale: map['sprites']['other']['dream_world']['front_female'],
      mainSkill: map['abilities'][0]['ability']['name'] ?? '',
      species: map['species']['name'] ?? '',
      types: map['types'][0]['type']['name'] ?? '',
      weight: map['weight'] ?? 0,
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonsIdModel.fromJson(String source) =>
      PokemonsIdModel.fromMap(json.decode(source));
}
