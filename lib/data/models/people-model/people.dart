import 'package:json_annotation/json_annotation.dart';

import '../../../infra/constants.dart';
part 'people.g.dart';

@JsonSerializable(
  anyMap: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class People {
  final String name;
  final double height;
  final double mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String male;
  @JsonKey(defaultValue: [InfraConstants.DEFAULT_PEOPLE_SPECIE])
  final List<String> species;

  People(
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.male,
    this.species,
  );

  factory People.fromJson(Map json) => _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}
