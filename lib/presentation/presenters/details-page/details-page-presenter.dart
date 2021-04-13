import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/data/models/planet-model/planet.dart';
import 'package:popcode_challenge_swapi/data/models/species-model/specie.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-planet-remote/find-planet-remote.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-species-remote/find-species-remote.dart';

import 'package:popcode_challenge_swapi/ui/pages/details/details-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/utils/notification-service.dart';

part 'details-page-presenter.g.dart';

@injectable
class DetailsPagePresenter = _DetailsPagePresenterBase
    with _$DetailsPagePresenter;

abstract class _DetailsPagePresenterBase
    with Store
    implements IDetailsPagePresenter {
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

  void initAnimation() {
    this._setAnimation(0, 0);
  }

  void findHomeWorld(String endpoint) {
    FindPlanetRemote.execute(endpoint).then(_setPlanet);
  }

  void findSpecies(List<String> endpoints) {
    FindSpeciesRemote.execute(endpoints).then(print);
  }
}
