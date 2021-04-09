import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

import '../../ui/pages/splash/splash-page-presenter.dart';

part 'store-splash-presenter.g.dart';

@Injectable()
class SplashPresenterStore = _SplashPresenterStoreBase
    with _$SplashPresenterStore;

abstract class _SplashPresenterStoreBase
    with Store
    implements SplashPagePresenter {
  Future<dynamic> updateLocalData() async {}
}
