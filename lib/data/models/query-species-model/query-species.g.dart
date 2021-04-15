// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query-species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuerySpecies _$QuerySpeciesFromJson(Map json) {
  return QuerySpecies(
    json['count'] as int,
    json['next'] as String? ?? '',
    json['previous'] as String? ?? '',
    (json['results'] as List<dynamic>)
        .map((e) => Specie.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList(),
  );
}

Map<String, dynamic> _$QuerySpeciesToJson(QuerySpecies instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
