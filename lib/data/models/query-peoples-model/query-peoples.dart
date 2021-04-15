import 'package:json_annotation/json_annotation.dart';

import '../people-model/people.dart';

part 'query-peoples.g.dart';

@JsonSerializable(
  anyMap: true,
  includeIfNull: true,
)
class QueryPeoples {
  int count;
  @JsonKey(defaultValue: '')
  String next;
  @JsonKey(defaultValue: '')
  String previous;
  List<People> results;

  QueryPeoples(this.count, this.next, this.previous, this.results);

  factory QueryPeoples.fromJson(Map json) => _$QueryPeoplesFromJson(json);
  Map<String, dynamic> toJson() => _$QueryPeoplesToJson(this);
}
