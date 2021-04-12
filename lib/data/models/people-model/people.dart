import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(
  anyMap: true,
  fieldRename: FieldRename.snake,
  includeIfNull: true,
)
class People extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String height;

  @HiveField(2)
  final String mass;

  @HiveField(3)
  final String hairColor;

  @HiveField(4)
  final String skinColor;

  @HiveField(5)
  final String eyeColor;

  @HiveField(6)
  final String birthYear;

  @HiveField(7)
  final String gender;

  @HiveField(8)
  final List<String> species;

  @HiveField(9)
  final String homeworld;

  People(
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.species,
    this.homeworld,
  );

  factory People.fromJson(Map json) => _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}
