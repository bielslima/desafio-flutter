// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/http/http.dart' as _i4;
import '../../presentation/presenters/details-page/details-page-presenter.dart'
    as _i3;
import '../../presentation/presenters/home-page/home-page-presenter.dart'
    as _i9;
import '../../presentation/presenters/splash-page/splash-presenter.dart' as _i7;
import '../app/application-store.dart' as _i8;
import '../http/http-impl.dart' as _i5;
import '../repositories/People/people-repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DetailsPagePresenter>(() => _i3.DetailsPagePresenter());
  gh.factory<_i4.HttpClient>(() => _i5.HttpImpl());
  gh.factory<_i6.PeopleRepository>(() => _i6.PeopleRepository());
  gh.factory<_i7.SplashPresenter>(() => _i7.SplashPresenter());
  gh.singleton<_i8.ApplicationStore>(_i8.ApplicationStore());
  gh.singleton<_i9.HomePagePresenter>(_i9.HomePagePresenter());
  return get;
}
