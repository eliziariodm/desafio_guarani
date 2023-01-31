import 'dart:convert';

class PokemonsModel {
  final String name;
  final String url;

  PokemonsModel({
    required this.name,
    required this.url,
  });

  PokemonsModel copyWith({
    String? name,
    String? url,
  }) {
    return PokemonsModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

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
