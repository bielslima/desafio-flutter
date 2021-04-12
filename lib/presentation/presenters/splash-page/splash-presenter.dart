import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/local-storage/local-storage.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-peoples-remote/find-peoples-remote.dart';
import 'package:popcode_challenge_swapi/data/models/query-peoples/query-peoples.dart';
import 'package:popcode_challenge_swapi/infra/constants.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/utils/NetworkStatus.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/home-page/home-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/pages/splash/splash-page-presenter.dart';

part 'splash-presenter.g.dart';

@injectable
class SplashPresenter = _SplashPresenterBase with _$SplashPresenter;

abstract class _SplashPresenterBase with Store implements ISplashPagePresenter {
  final HomePagePresenter homePresenter = getIt<HomePagePresenter>();
  // late final LocalStorage localStorage;

  Future findPeoples() async {
    try {
      QueryPeoples qryRemote = await FindPeoplesRemote.execute();
      homePresenter.setQueryPeoples(qryRemote);
      // bool isConnected = await NetworkStatus.execute();

      // if (isConnected) {
      //   // localStorage.writeAll(boxName: InfraConstants.BOX_PEOPLE, data: qryRemote.)
      // }
    } catch (e) {
      rethrow;
    }
  }

  Future updateLocalData() async {
    try {
      bool isConnected = await NetworkStatus.execute();

      if (isConnected) {
        QueryPeoples qryRemote = await FindPeoplesRemote.execute();
        homePresenter.setQueryPeoples(qryRemote);
        // localStorage.writeAll(boxName: InfraConstants.BOX_PEOPLE, data: {});
      }
    } catch (e) {
      rethrow;
    }
  }
}
