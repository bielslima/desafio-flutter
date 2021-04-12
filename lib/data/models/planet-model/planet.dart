import 'package:json_annotation/json_annotation.dart';

part 'planet.g.dart';

@JsonSerializable(
  anyMap: true,
  fieldRename: FieldRename.snake,
)
class Planet {
  String name;
  String rotationPeriod;
  String orbitalPeriod;
  String diameter;
  String climate;
  String gravity;
  String terrain;
  String surfaceWater;
  String population;
  List<String> residents;
  List<String> films;
  String created;
  String edited;
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
}
