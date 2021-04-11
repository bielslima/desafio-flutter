// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PeopleAdapter extends TypeAdapter<People> {
  @override
  final int typeId = 1;

  @override
  People read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return People(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, People obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.mass)
      ..writeByte(3)
      ..write(obj.hairColor)
      ..writeByte(4)
      ..write(obj.skinColor)
      ..writeByte(5)
      ..write(obj.eyeColor)
      ..writeByte(6)
      ..write(obj.birthYear)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.species);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeopleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map json) {
  return People(
    json['name'] as String,
    json['height'] as String,
    json['mass'] as String,
    json['hair_color'] as String,
    json['skin_color'] as String,
    json['eye_color'] as String,
    json['birth_year'] as String,
    json['gender'] as String,
    (json['species'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        ['https://swapi.dev/api/species/1'],
  );
}

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'mass': instance.mass,
      'hair_color': instance.hairColor,
      'skin_color': instance.skinColor,
      'eye_color': instance.eyeColor,
      'birth_year': instance.birthYear,
      'gender': instance.gender,
      'species': instance.species,
    };
