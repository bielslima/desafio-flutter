// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specie _$SpecieFromJson(Map json) {
  return Specie(
    json['name'] as String,
    json['classification'] as String,
    json['designation'] as String,
    json['average_height'] as String,
    json['skin_colors'] as String,
    json['hair_colors'] as String,
    json['eye_colors'] as String,
    json['average_lifespan'] as String,
    json['homeworld'] as String,
    json['language'] as String,
    (json['people'] as List<dynamic>).map((e) => e as String).toList(),
    (json['films'] as List<dynamic>).map((e) => e as String).toList(),
    json['created'] as String,
    json['edited'] as String,
    json['url'] as String,
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
