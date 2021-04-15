import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/usecases/remove-people-favorite/remove-people-favorite.dart';
import '../../../domain/usecases/set-people-favorite-local/set-people-favorite-local.dart';

part 'people.g.dart';

@HiveType(typeId: 0)
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

  @HiveField(10)
  final String created;

  @HiveField(11)
  final String edited;

  @HiveField(12)
  final String url;

  @JsonKey(defaultValue: false)
  bool isFavorite = false;

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
    this.created,
    this.edited,
    this.url,
  );

  factory People.fromJson(Map json) => _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);

  String get id {
    return this.url.replaceAll(new RegExp('([A-Za-z\/.:])'), '');
  }

  Future<bool> toggleFavorite(bool isFavorite) async {
    isFavorite
        ? await RemovePeopleFavorite.execute(this.id)
        : await SetPeopleFavoriteLocal.execute(this.id);
    this.isFavorite = !isFavorite;
    return this.isFavorite;
  }
}
