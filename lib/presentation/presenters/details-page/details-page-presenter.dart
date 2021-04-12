import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

import 'package:popcode_challenge_swapi/ui/pages/details/details-page-presenter.dart';

part 'details-page-presenter.g.dart';

@injectable
class DetailsPagePresenter = _DetailsPagePresenterBase
    with _$DetailsPagePresenter;

abstract class _DetailsPagePresenterBase
    with Store
    implements IDetailsPagePresenter {
  @observable
  late double x = -200, x2 = -200;

  @action
  _setAnimation(double x, double x2) {
    this.x = x;
    this.x2 = x2;
  }

  void initAnimation() {
    this._setAnimation(0, 0);
  }
}
