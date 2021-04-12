// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/http/http.dart' as _i4;
import '../../data/local-storage/local-storage.dart' as _i6;
import '../../presentation/presenters/details-page/details-page-presenter.dart'
    as _i3;
import '../../presentation/presenters/home-page/home-page-presenter.dart'
    as _i12;
import '../../presentation/presenters/search-page/search-page-presenter.dart'
    as _i9;
import '../../presentation/presenters/splash-page/splash-presenter.dart'
    as _i10;
import '../app/application-store.dart' as _i11;
import '../http/http-impl.dart' as _i5;
import '../local-storage/hive-storage.dart' as _i7;
import '../repositories/People/people-repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DetailsPagePresenter>(() => _i3.DetailsPagePresenter());
  gh.factory<_i4.HttpClient>(() => _i5.HttpImpl());
  gh.factory<_i6.LocalStorage>(() => _i7.LocalStorageImpl());
  gh.factory<_i8.PeopleRepository>(() => _i8.PeopleRepository());
  gh.factory<_i9.SearchPagePresenter>(() => _i9.SearchPagePresenter());
  gh.factory<_i10.SplashPresenter>(() => _i10.SplashPresenter());
  gh.singleton<_i11.ApplicationStore>(_i11.ApplicationStore());
  gh.singleton<_i12.HomePagePresenter>(_i12.HomePagePresenter());
  return get;
}
