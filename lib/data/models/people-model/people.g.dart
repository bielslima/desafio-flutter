// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PeopleAdapter extends TypeAdapter<People> {
  @override
  final int typeId = 0;

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
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, People obj) {
    writer
      ..writeByte(13)
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
      ..write(obj.species)
      ..writeByte(9)
      ..write(obj.homeworld)
      ..writeByte(10)
      ..write(obj.created)
      ..writeByte(11)
      ..write(obj.edited)
      ..writeByte(12)
      ..write(obj.url);
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
    (json['species'] as List<dynamic>).map((e) => e as String).toList(),
    json['homeworld'] as String,
    json['created'] as String,
    json['edited'] as String,
    json['url'] as String,
  )..isFavorite = json['is_favorite'] as bool? ?? false;
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
      'homeworld': instance.homeworld,
      'created': instance.created,
      'edited': instance.edited,
      'url': instance.url,
      'is_favorite': instance.isFavorite,
    };
