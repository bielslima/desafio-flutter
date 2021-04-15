import 'package:json_annotation/json_annotation.dart';
import 'package:popcode_challenge_swapi/data/models/models.dart';

part 'query-planets.g.dart';

@JsonSerializable(
  anyMap: true,
  includeIfNull: true,
)
class QueryPlanets {
  int count;
  @JsonKey(defaultValue: '')
  String next;
  @JsonKey(defaultValue: '')
  String previous;
  List<Planet> results;

  QueryPlanets(this.count, this.next, this.previous, this.results);

  factory QueryPlanets.fromJson(Map json) => _$QueryPlanetsFromJson(json);
  Map<String, dynamic> toJson() => _$QueryPlanetsToJson(this);
}
