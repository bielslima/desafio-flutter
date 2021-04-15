import 'package:json_annotation/json_annotation.dart';

import '../species-model/specie.dart';

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
