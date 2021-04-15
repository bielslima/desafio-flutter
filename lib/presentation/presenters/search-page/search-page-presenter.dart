import 'package:mobx/mobx.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/domain/usecases/search-peoples-local/search-peoples-local.dart';
import 'package:popcode_challenge_swapi/domain/usecases/search-peoples-remote/search-peoples-remote.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/home-page/home-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/pages/search/search-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/utils/notification-service.dart';
import 'package:injectable/injectable.dart';
part 'search-page-presenter.g.dart';

@injectable
class SearchPagePresenter = _SearchPagePresenterBase with _$SearchPagePresenter;

abstract class _SearchPagePresenterBase
    with Store
    implements ISearchPagePresenter {
  HomePagePresenter _homePresenter = getIt<HomePagePresenter>();

  @observable
  List<People> peoplesSrc = [];

  @observable
  bool isSearchingPeoples = false;

  @action
  void setPeoples(List<People> pList) => this.peoplesSrc = pList;

  @action
  void setIsSearchingPeoples(bool v) => this.isSearchingPeoples = v;

  @override
  void searchExpression(String inputExpression) async {
    if (inputExpression.isEmpty) return;
    this.setIsSearchingPeoples(true);
    try {
      await SearchPeoplesLocal.execute(inputExpression).then((peoples) {
        this.setPeoples(peoples);
      });
    } catch (e) {
      NotificationService.showToastError(e.toString());
    } finally {
      this.setIsSearchingPeoples(false);
    }
  }
}
