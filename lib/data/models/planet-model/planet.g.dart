// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

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
