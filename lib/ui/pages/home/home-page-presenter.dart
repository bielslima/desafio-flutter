import '../../../data/models/people-model/people.dart';
import '../../../data/models/query-peoples-model/query-peoples.dart';

abstract class IHomePagePresenter {
  void setValueFavoriteToPeople(String idPeople, bool v);
  void setShowOnlyFavorites(bool v);
  void setQueryPeoples(QueryPeoples query);
  void setPeoples(List<People> peoples);

  void loadingAllPeoples();
}
