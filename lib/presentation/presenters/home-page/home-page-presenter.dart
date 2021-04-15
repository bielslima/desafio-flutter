import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/data/models/query-peoples-model/query-peoples.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-peoples-url/find-peoples-url.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

import 'package:popcode_challenge_swapi/ui/pages/home/home-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/utils/notification-service.dart';

part 'home-page-presenter.g.dart';

@singleton
class HomePagePresenter = _HomePagePresenterBase with _$HomePagePresenter;

abstract class _HomePagePresenterBase with Store implements IHomePagePresenter {
  final ApplicationStore appControl = getIt<ApplicationStore>();
  int currentPageList = 1;

  QueryPeoples? qryPeoples;

  @observable
  bool showOnlyFavorites = false;

  @observable
  ObservableList<People> peoples = new ObservableList();

  @observable
  ObservableList<People> peoplesFavorites = new ObservableList();

  @observable
  bool isLoadingMorePeoples = false;

  @action
  void setValueFavoriteToPeople(String idPeople, bool v) {
    // this.peoples.
    this.peoples = ObservableList.of(this.peoples.map(
      (element) {
        if (element.id == idPeople) element.isFavorite = v;
        return element;
      },
    ).toList());
    // this
    //     .peoples
    //     .where((element) => element.id == idPeople)
    //     .toList()[0]
    //     .isFavorite = v;
  }

  @action
  void setShowOnlyFavorites(bool v) {
    if (v) {
      this.peoplesFavorites =
          ObservableList.of(this.peoples.where((e) => e.isFavorite).toList());
    }
    this.showOnlyFavorites = v;
  }

  @action
  void _addPeoples(Iterable<People>? elements) {
    this.peoples.addAll(elements ?? []);
  }

  @action
  void _setPeoples(List<People>? _peoples) =>
      this.peoples.addAll(_peoples ?? []);

  @action
  void _setLoadingMorePeoples(bool v) => this.isLoadingMorePeoples = v;

  void setQueryPeoples(QueryPeoples _qry) {
    this.qryPeoples = _qry;
    this._setPeoples(this.qryPeoples?.results);
  }

  void setPeoples(List<People> peoples) => this._setPeoples(List.of(peoples));

  void loadingAllPeoples() async {
    if (this.qryPeoples == null) return;
    _setLoadingMorePeoples(true);
    try {
      while (this.qryPeoples?.next != '') {
        this.qryPeoples = await FindPeoplesUrl.execute(this.qryPeoples?.next);
        this._addPeoples(qryPeoples?.results);
      }
    } catch (e) {
      NotificationService.showToastError('Failed to fetch more results: $e');
    } finally {
      _setLoadingMorePeoples(false);
    }
  }
}
