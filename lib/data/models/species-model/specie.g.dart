// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpecieAdapter extends TypeAdapter<Specie> {
  @override
  final int typeId = 3;

  @override
  Specie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Specie(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      (fields[10] as List).cast<String>(),
      (fields[11] as List).cast<String>(),
      fields[12] as String,
      fields[13] as String,
      fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Specie obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.classification)
      ..writeByte(2)
      ..write(obj.designation)
      ..writeByte(3)
      ..write(obj.averageHeight)
      ..writeByte(4)
      ..write(obj.skinColors)
      ..writeByte(5)
      ..write(obj.hairColors)
      ..writeByte(6)
      ..write(obj.eyeColors)
      ..writeByte(7)
      ..write(obj.averageLifespan)
      ..writeByte(8)
      ..write(obj.homeworld)
      ..writeByte(9)
      ..write(obj.language)
      ..writeByte(10)
      ..write(obj.people)
      ..writeByte(11)
      ..write(obj.films)
      ..writeByte(12)
      ..write(obj.created)
      ..writeByte(13)
      ..write(obj.edited)
      ..writeByte(14)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specie _$SpecieFromJson(Map json) {
  return Specie(
    json['name'] as String? ?? '',
    json['classification'] as String? ?? '',
    json['designation'] as String? ?? '',
    json['average_height'] as String? ?? '',
    json['skin_colors'] as String? ?? '',
    json['hair_colors'] as String? ?? '',
    json['eye_colors'] as String? ?? '',
    json['average_lifespan'] as String? ?? '',
    json['homeworld'] as String? ?? '',
    json['language'] as String? ?? '',
    (json['people'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    (json['films'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    json['created'] as String? ?? '',
    json['edited'] as String? ?? '',
    json['url'] as String? ?? '',
  );
}

Map<String, dynamic> _$SpecieToJson(Specie instance) => <String, dynamic>{
      'name': instance.name,
      'classification': instance.classification,
      'designation': instance.designation,
      'average_height': instance.averageHeight,
      'skin_colors': instance.skinColors,
      'hair_colors': instance.hairColors,
      'eye_colors': instance.eyeColors,
      'average_lifespan': instance.averageLifespan,
      'homeworld': instance.homeworld,
      'language': instance.language,
      'people': instance.people,
      'films': instance.films,
      'created': instance.created,
      'edited': instance.edited,
      'url': instance.url,
    };
