import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'planet.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(
  anyMap: true,
  fieldRename: FieldRename.snake,
)
class Planet extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String rotationPeriod;

  @HiveField(2)
  String orbitalPeriod;

  @HiveField(3)
  String diameter;

  @HiveField(4)
  String climate;

  @HiveField(5)
  String gravity;

  @HiveField(6)
  String terrain;

  @HiveField(7)
  String surfaceWater;

  @HiveField(8)
  String population;

  @HiveField(9)
  List<String> residents;

  @HiveField(10)
  List<String> films;

  @HiveField(11)
  String created;

  @HiveField(12)
  String edited;

  @HiveField(13)
  String url;

  Planet(
    this.name,
    this.rotationPeriod,
    this.orbitalPeriod,
    this.diameter,
    this.climate,
    this.gravity,
    this.terrain,
    this.surfaceWater,
    this.population,
    this.residents,
    this.films,
    this.created,
    this.edited,
    this.url,
  );

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);

  Map<String, dynamic> tojson() => _$PlanetToJson(this);

  String get id {
    return this.url.replaceAll(new RegExp('([A-Za-z\/.:])'), '');
  }
}
