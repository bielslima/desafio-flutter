import 'package:json_annotation/json_annotation.dart';

part 'specie.g.dart';

@JsonSerializable(
    anyMap: true, fieldRename: FieldRename.snake, includeIfNull: true)
class Specie {
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String classification;
  @JsonKey(defaultValue: '')
  String designation;
  @JsonKey(defaultValue: '')
  String averageHeight;
  @JsonKey(defaultValue: '')
  String skinColors;
  @JsonKey(defaultValue: '')
  String hairColors;
  @JsonKey(defaultValue: '')
  String eyeColors;
  @JsonKey(defaultValue: '')
  String averageLifespan;
  @JsonKey(defaultValue: '')
  String homeworld;
  @JsonKey(defaultValue: '')
  String language;
  @JsonKey(defaultValue: [])
  List<String> people;
  @JsonKey(defaultValue: [])
  List<String> films;
  @JsonKey(defaultValue: '')
  String created;
  @JsonKey(defaultValue: '')
  String edited;
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
}
