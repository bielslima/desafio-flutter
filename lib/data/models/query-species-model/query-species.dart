import 'package:json_annotation/json_annotation.dart';
import 'package:popcode_challenge_swapi/data/models/models.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';

part 'query-species.g.dart';

@JsonSerializable(
  anyMap: true,
  includeIfNull: true,
)
class QuerySpecies {
  int count;
  @JsonKey(defaultValue: '')
  String next;
  @JsonKey(defaultValue: '')
  String previous;
  List<Specie> results;

  QuerySpecies(this.count, this.next, this.previous, this.results);

  factory QuerySpecies.fromJson(Map json) => _$QuerySpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$QuerySpeciesToJson(this);
}
