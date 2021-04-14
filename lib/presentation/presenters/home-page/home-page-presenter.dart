import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/data/models/query-peoples-model/query-peoples.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-peoples-remote/find-peoples-remote.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/routes/routes.dart';

import 'package:popcode_challenge_swapi/ui/pages/home/home-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/utils/notification-service.dart';

part 'home-page-presenter.g.dart';

@singleton
class HomePagePresenter = _HomePagePresenterBase with _$HomePagePresenter;

abstract class _HomePagePresenterBase with Store implements IHomePagePresenter {
  final ApplicationStore appControl = getIt<ApplicationStore>();
  int currentPageList = 1;

  late QueryPeoples qryPeoples;
  late ScrollController scrollController;

  @observable
  ObservableList<People> peoples = new ObservableList();

  @observable
  bool isLoadingMorePeoples = false;

  @action
  void _addPeoples(Iterable<People> elements) {
    this.peoples.addAll(elements);
  }

  @action
  void _setPeoples(List<People> _peoples) => this.peoples.addAll(_peoples);

  @action
  void _setLoadingMorePeoples(bool v) => this.isLoadingMorePeoples = v;

  void setQueryPeoples(QueryPeoples _qry) {
    this.qryPeoples = _qry;
    this._setPeoples(this.qryPeoples.results);
  }

  void setPeoples(List<People> peoples) {
    this._setPeoples(List.of(peoples));
  }

  void loadingMorePeoples() async {
    if (!this.appControl.isConnected) return;

    _setLoadingMorePeoples(true);
    try {
      if (this.qryPeoples.next == '') return;

      print('Find more data ?page=${this.currentPageList + 1}');

      QueryPeoples _qryPeoples =
          await FindPeoplesRemote.execute(page: this.currentPageList + 1);

      this.currentPageList++;

      this._addPeoples(_qryPeoples.results);

      this.qryPeoples = _qryPeoples;
    } catch (e) {
      NotificationService.showToastError('Failed to fetch more results: $e');
    } finally {
      _setLoadingMorePeoples(false);
    }
  }

  Future toggleFavorite() async {}

  void showDetails(BuildContext context, int indexPeople) {
    appControl.navigateTo(
      context,
      RouterPaths.DETAILS.replaceAll(':id', indexPeople.toString()),
      transitionType: TransitionType.fadeIn,
    );
  }

  void btnSearchPeople(BuildContext context) {
    appControl.navigateTo(
      context,
      RouterPaths.SEARCH,
      transitionType: TransitionType.fadeIn,
    );
  }

  void dispose() {
    this.scrollController.dispose();
  }

  void listenerScroll(ScrollController scrollController) {
    if (this.isLoadingMorePeoples) return;
    if (scrollController.position.pixels >=
        (scrollController.position.maxScrollExtent * .8)) {
      this.loadingMorePeoples();
    }
  }
}
