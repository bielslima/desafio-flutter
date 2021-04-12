import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-peoples-remote/find-peoples-remote.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/home-page/home-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/pages/splash/splash-page-presenter.dart';
part 'splash-presenter.g.dart';

@injectable
class SplashPresenter = _SplashPresenterBase with _$SplashPresenter;

abstract class _SplashPresenterBase with Store implements ISplashPagePresenter {
  final HomePagePresenter homePresenter = getIt<HomePagePresenter>();
  Future updateLocalData() async {
    try {
      await FindPeoplesRemote.execute()
          .then((value) => homePresenter.setQueryPeoples(value));
    } catch (e) {
      throw e;
    }
  }
}
