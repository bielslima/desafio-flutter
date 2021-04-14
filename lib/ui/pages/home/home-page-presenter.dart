import 'package:popcode_challenge_swapi/data/models/query-peoples-model/query-peoples.dart';

abstract class IHomePagePresenter {
  Future toggleFavorite();

  void setQueryPeoples(QueryPeoples _qry);
  void loadingMorePeoples();
}
