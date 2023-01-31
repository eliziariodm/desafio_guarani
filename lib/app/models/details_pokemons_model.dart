import 'dart:convert';

class DetailsPokemonsModel {
  final String svg;
  final String? frontFemale;

  DetailsPokemonsModel({
    required this.svg,
    this.frontFemale,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'front_default': svg,
    };

    if (frontFemale != null) {
      map['front_female'] = frontFemale;
    }

    return map;
  }

  factory DetailsPokemonsModel.fromMap(Map<String, dynamic> map) {
    return DetailsPokemonsModel(
      svg: map['front_default'] ?? '',
      frontFemale: map['front_female'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsPokemonsModel.fromJson(String source) =>
      DetailsPokemonsModel.fromMap(json.decode(source));
}
