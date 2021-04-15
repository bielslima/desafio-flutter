import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'specie.g.dart';

@HiveType(typeId: 3)
@JsonSerializable(
    anyMap: true, fieldRename: FieldRename.snake, includeIfNull: true)
class Specie extends HiveObject {
  @HiveField(0)
  @JsonKey(defaultValue: '')
  String name;

  @HiveField(1)
  @JsonKey(defaultValue: '')
  String classification;

  @HiveField(2)
  @JsonKey(defaultValue: '')
  String designation;

  @HiveField(3)
  @JsonKey(defaultValue: '')
  String averageHeight;

  @HiveField(4)
  @JsonKey(defaultValue: '')
  String skinColors;

  @HiveField(5)
  @JsonKey(defaultValue: '')
  String hairColors;

  @HiveField(6)
  @JsonKey(defaultValue: '')
  String eyeColors;

  @HiveField(7)
  @JsonKey(defaultValue: '')
  String averageLifespan;

  @HiveField(8)
  @JsonKey(defaultValue: '')
  String homeworld;

  @HiveField(9)
  @JsonKey(defaultValue: '')
  String language;

  @HiveField(10)
  @JsonKey(defaultValue: [])
  List<String> people;

  @HiveField(11)
  @JsonKey(defaultValue: [])
  List<String> films;

  @HiveField(12)
  @JsonKey(defaultValue: '')
  String created;

  @HiveField(13)
  @JsonKey(defaultValue: '')
  String edited;

  @HiveField(14)
  @JsonKey(defaultValue: '')
  String url;

  Specie(
      this.name,
      this.classification,
      this.designation,
      this.averageHeight,
      this.skinColors,
      this.hairColors,
      this.eyeColors,
      this.averageLifespan,
      this.homeworld,
      this.language,
      this.people,
      this.films,
      this.created,
      this.edited,
      this.url);

  factory Specie.fromJson(Map<String, dynamic> json) => _$SpecieFromJson(json);

  Map<String, dynamic> toJson() => _$SpecieToJson(this);

  String get id {
    return this.url.replaceAll(new RegExp('([A-Za-z\/.:])'), '');
  }
}
