import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-people/find-people.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-peoples/find-peoples.dart';
import 'package:popcode_challenge_swapi/ui/pages/splash/splash-page-presenter.dart';
part 'splash-presenter.g.dart';

@injectable
class SplashPresenter = _SplashPresenterBase with _$SplashPresenter;

abstract class _SplashPresenterBase with Store implements ISplashPagePresenter {
  Future updateLocalData() async {
    try {
      await FindPeoples.execute().then((value) => print(value.results.length));
    } catch (e) {
      print(e);
    }
  }
}
