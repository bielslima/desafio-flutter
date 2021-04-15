import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/people-model/people.dart';
import '../../../domain/usecases/find-all-peoples-local/find-all-peoples-local.dart';
import '../../../domain/usecases/find-all-planets/find-all-planets.dart';
import '../../../domain/usecases/find-all-species/find-all-species.dart';
import '../../../domain/usecases/find-peoples-remote/find-peoples-remote.dart';
import '../../../data/models/query-peoples-model/query-peoples.dart';
import '../../../domain/usecases/send-queue-favorites/send-queue-favorites.dart';
import '../../../infra/app/application-store.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/utils/NetworkStatus.dart';
import '../../../presentation/presenters/home-page/home-page-presenter.dart';
import '../../../ui/pages/splash/splash-page-presenter.dart';
import '../../../ui/utils/notification-service.dart';

part 'splash-presenter.g.dart';

@injectable
class SplashPresenter = _SplashPresenterBase with _$SplashPresenter;

abstract class _SplashPresenterBase with Store implements ISplashPagePresenter {
  final HomePagePresenter homePresenter = getIt<HomePagePresenter>();
  final ApplicationStore appStore = getIt<ApplicationStore>();

  Future init() async {
    try {
      appStore.isConnected = await NetworkStatus.execute();
      if (appStore.isConnected) {
        await SendQueueFavorites.execute();
        FindAllPlanets.execute();
        FindAllSpecies.execute();
      }
      await this.findPeoples();
    } catch (e) {
      rethrow;
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
