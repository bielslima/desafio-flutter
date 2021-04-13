// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query-peoples.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryPeoples _$QueryPeoplesFromJson(Map json) {
  return QueryPeoples(
    json['count'] as int,
    json['next'] as String? ?? '',
    json['previous'] as String? ?? '',
    (json['results'] as List<dynamic>)
        .map((e) => People.fromJson(e as Map))
        .toList(),
  );
}

Map<String, dynamic> _$QueryPeoplesToJson(QueryPeoples instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
