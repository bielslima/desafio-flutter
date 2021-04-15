import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/data/models/planet-model/planet.dart';
import 'package:popcode_challenge_swapi/data/models/species-model/specie.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-people-local/find-people-local.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-planet-local/find-planet-local.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-planet-remote/find-planet-remote.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-species-remote/find-species-remote.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';

import 'package:popcode_challenge_swapi/ui/pages/details/details-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/utils/notification-service.dart';

part 'details-page-presenter.g.dart';

@injectable
class DetailsPagePresenter = _DetailsPagePresenterBase
    with _$DetailsPagePresenter;

abstract class _DetailsPagePresenterBase
    with Store
    implements IDetailsPagePresenter {
  ApplicationStore appStore = getIt<ApplicationStore>();

  @observable
  bool isFetchingPlanetAndSpecie = true;

  @observable
  bool isLoadingPeople = false;

  @observable
  late People people;

  @observable
  Specie? specie;

  @observable
  Planet? planet;

  @observable
  late double x = -200, x2 = -200;

  @action
  _setAnimation(double x, double x2) {
    this.x = x;
    this.x2 = x2;
  }

  @action
  _setPlanet(Planet p) => this.planet = p;

  @action
  _setSpecie(Specie s) => this.specie = s;

  @action
  _setIsFetchingPlanetAndSpecie(bool v) => this.isFetchingPlanetAndSpecie = v;

  @action
  _setIsLoadingPeople(bool v) => this.isLoadingPeople = v;

  @action
  _setPeople(People p) => this.people = p;

  void initAnimation() {
    this._setAnimation(0, 0);
  }

  Future searchPeopleById(String id) async {
    try {
      _setIsLoadingPeople(true);

      await FindPeopleLocal.execute(id).then(_setPeople);

      this.findHomeWorldAndSpecies(this.people.homeworld, this.people.species);
    } catch (e) {
      NotificationService.showToastError(
          'Failed to fetch person information: $e');
    } finally {
      _setIsLoadingPeople(true);
    }
  }

  void findHomeWorldAndSpecies(String endpoint, List<String> endpoints) {
    if (appStore.isConnected)
      Future.wait([
        FindPlanetRemote.execute(endpoint),
        FindSpeciesRemote.execute(endpoints),
      ]).then((result) {
        this._setIsFetchingPlanetAndSpecie(false);
        this._setPlanet(result[0]);
        if (result[1].length != 0) this._setSpecie(result[1][0]);
      });
    else
      Future.wait([
        FindPlanetLocal.execute(endpoint),
        // FindSpecieLocal.execute(endpoints),
      ]).then(
        (result) {
          this._setIsFetchingPlanetAndSpecie(false);
          this._setPlanet(result[0]);
          // if (result[1].length != 0) this._setSpecie(result[1] as Specie);
        },
      );
  }
}
