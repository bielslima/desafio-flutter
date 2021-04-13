import 'package:json_annotation/json_annotation.dart';

part 'specie.g.dart';

@JsonSerializable(
  anyMap: true,
  fieldRename: FieldRename.snake,
)
class Specie {
  String name;
  String classification;
  String designation;
  String averageHeight;
  String skinColors;
  String hairColors;
  String eyeColors;
  String averageLifespan;
  String homeworld;
  String language;
  List<String> people;
  List<String> films;
  String created;
  String edited;
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
