import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/people-model/people.dart';
import '../../../domain/usecases/search-peoples-local/search-peoples-local.dart';
import '../../../ui/pages/search/search-page-presenter.dart';
import '../../../ui/utils/notification-service.dart';

part 'search-page-presenter.g.dart';

@injectable
class SearchPagePresenter = _SearchPagePresenterBase with _$SearchPagePresenter;

abstract class _SearchPagePresenterBase
    with Store
    implements ISearchPagePresenter {
  @observable
  List<People> peoplesSrc = [];

  @observable
  bool isSearchingPeoples = false;

  @action
  void _setPeoples(List<People> pList) => this.peoplesSrc = pList;

  @action
  void _setIsSearchingPeoples(bool v) => this.isSearchingPeoples = v;

  @override
  void searchExpression(String inputExpression) async {
    if (inputExpression.isEmpty) return;
    this._setIsSearchingPeoples(true);
    try {
      List<People> peoples = SearchPeoplesLocal.execute(inputExpression);
      this._setPeoples(peoples);
    } catch (e) {
      NotificationService.showToastError(e.toString());
    } finally {
      this._setIsSearchingPeoples(false);
    }
  }
}
