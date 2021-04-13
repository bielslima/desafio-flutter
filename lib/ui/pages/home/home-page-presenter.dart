import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/data/models/query-peoples-model/query-peoples.dart';

abstract class IHomePagePresenter {
  Future toggleFavorite();

  void _setPeoples(List<People> _peoples);
  void setQueryPeoples(QueryPeoples _qry);
  void loadingMorePeoples();
}
