// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query-planets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryPlanets _$QueryPlanetsFromJson(Map json) {
  return QueryPlanets(
    json['count'] as int,
    json['next'] as String? ?? '',
    json['previous'] as String? ?? '',
    (json['results'] as List<dynamic>)
        .map((e) => Planet.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList(),
  );
}

Map<String, dynamic> _$QueryPlanetsToJson(QueryPlanets instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
