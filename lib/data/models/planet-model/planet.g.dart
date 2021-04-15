// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlanetAdapter extends TypeAdapter<Planet> {
  @override
  final int typeId = 2;

  @override
  Planet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Planet(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      (fields[9] as List).cast<String>(),
      (fields[10] as List).cast<String>(),
      fields[11] as String,
      fields[12] as String,
      fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Planet obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.rotationPeriod)
      ..writeByte(2)
      ..write(obj.orbitalPeriod)
      ..writeByte(3)
      ..write(obj.diameter)
      ..writeByte(4)
      ..write(obj.climate)
      ..writeByte(5)
      ..write(obj.gravity)
      ..writeByte(6)
      ..write(obj.terrain)
      ..writeByte(7)
      ..write(obj.surfaceWater)
      ..writeByte(8)
      ..write(obj.population)
      ..writeByte(9)
      ..write(obj.residents)
      ..writeByte(10)
      ..write(obj.films)
      ..writeByte(11)
      ..write(obj.created)
      ..writeByte(12)
      ..write(obj.edited)
      ..writeByte(13)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Planet _$PlanetFromJson(Map json) {
  return Planet(
    json['name'] as String,
    json['rotation_period'] as String,
    json['orbital_period'] as String,
    json['diameter'] as String,
    json['climate'] as String,
    json['gravity'] as String,
    json['terrain'] as String,
    json['surface_water'] as String,
    json['population'] as String,
    (json['residents'] as List<dynamic>).map((e) => e as String).toList(),
    (json['films'] as List<dynamic>).map((e) => e as String).toList(),
    json['created'] as String,
    json['edited'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$PlanetToJson(Planet instance) => <String, dynamic>{
      'name': instance.name,
      'rotation_period': instance.rotationPeriod,
      'orbital_period': instance.orbitalPeriod,
      'diameter': instance.diameter,
      'climate': instance.climate,
      'gravity': instance.gravity,
      'terrain': instance.terrain,
      'surface_water': instance.surfaceWater,
      'population': instance.population,
      'residents': instance.residents,
      'films': instance.films,
      'created': instance.created,
      'edited': instance.edited,
      'url': instance.url,
    };
