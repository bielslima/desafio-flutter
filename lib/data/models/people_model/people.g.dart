// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map json) {
  return People(
    json['name'] as String,
    (json['height'] as num).toDouble(),
    (json['mass'] as num).toDouble(),
    json['hair_color'] as String,
    json['skin_color'] as String,
    json['eye_color'] as String,
    json['birth_year'] as String,
    json['male'] as String,
    (json['species'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        ['http://swapi.dev/api/species/1'],
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
      'male': instance.male,
      'species': instance.species,
    };
