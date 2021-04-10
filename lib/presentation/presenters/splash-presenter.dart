import 'package:mobx/mobx.dart';
import 'package:popcode_challenge_swapi/ui/pages/splash/splash-page-presenter.dart';
part 'splash-presenter.g.dart';

class SplashPresenterImp = _SplashPresenterImpBase with _$SplashPresenterImp;

abstract class _SplashPresenterImpBase
    with Store
    implements ISplashPagePresenter {
  Future<dynamic> updateLocalData() async {}
}
