import 'package:hive/hive.dart';

import '../../models/pokemons_id_model.dart';

class PokemonHiveAdapter extends TypeAdapter<PokemonsIdModel> {
  @override
  final typeId = 0;

  @override
  PokemonsIdModel read(BinaryReader reader) {
    return PokemonsIdModel(
      name: reader.readString(),
      svg: reader.readString(),
      frontFemale: reader.readString(),
      mainSkill: reader.readString(),
      species: reader.readString(),
      types: reader.readString(),
      weight: reader.readInt(),
      favorite: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, PokemonsIdModel obj) {
    writer.writeString(obj.name ?? '');
    writer.writeString(obj.svg ?? '');
    writer.writeString(obj.frontFemale ?? '');
    writer.writeString(obj.mainSkill ?? '');
    writer.writeString(obj.species ?? '');
    writer.writeString(obj.types ?? '');
    writer.writeInt(obj.weight ?? 0);
    writer.writeBool(obj.favorite);
  }
}
