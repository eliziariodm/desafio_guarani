class PokemonsId {
  final String? name;
  final String? svg;
  final String? frontFemale;
  final String? mainSkill;
  final String? species;
  final String? types;
  final int? weight;
  bool favorite;

  PokemonsId({
    this.name,
    this.svg,
    this.frontFemale,
    this.mainSkill,
    this.species,
    this.types,
    this.weight,
    this.favorite = false,
  });
}
