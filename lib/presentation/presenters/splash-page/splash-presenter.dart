import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-peoples-local/find-peoples-local.dart';
import 'package:popcode_challenge_swapi/domain/usecases/find-peoples-remote/find-peoples-remote.dart';
import 'package:popcode_challenge_swapi/data/models/query-peoples-model/query-peoples.dart';
import 'package:popcode_challenge_swapi/domain/usecases/send-queue-favorites/send-queue-favorites.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/home-page/home-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/pages/splash/splash-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/utils/notification-service.dart';

part 'splash-presenter.g.dart';

@injectable
class SplashPresenter = _SplashPresenterBase with _$SplashPresenter;

abstract class _SplashPresenterBase with Store implements ISplashPagePresenter {
  final HomePagePresenter homePresenter = getIt<HomePagePresenter>();
  final ApplicationStore appStore = getIt<ApplicationStore>();
  // late final LocalStorage localStorage;

  Future init() async {
    try {
      // appStore.isConnected = await NetworkStatus.execute();
      // appStore.isConnected = false;
      // print('App connected: ${appStore.isConnected}');
      if (appStore.isConnected) {
        await SendQueueFavorites.execute();
        // await FindAllPeoplesLocal.execute();
      }
      await this.findPeoples();
    } catch (e) {
      print(e);
    }
  }

  Future findPeoples() async {
    try {
      if (this.appStore.isConnected) {
        QueryPeoples qryRemote = await FindPeoplesRemote.execute();
        homePresenter.setQueryPeoples(qryRemote);
      } else {
        final List<People> peoples = await FindPeoplesLocal.execute();
        homePresenter.setPeoples(peoples);
      }
    } catch (e) {
      NotificationService.showToastError(e.toString());
      rethrow;
    }
  }
}
