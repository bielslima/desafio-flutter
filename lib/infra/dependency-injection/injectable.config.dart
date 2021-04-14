// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/http/http.dart' as _i5;
import '../../data/local-storage/local-storage.dart' as _i7;
import '../../presentation/presenters/details-page/details-page-presenter.dart'
    as _i3;
import '../../presentation/presenters/home-page/home-page-presenter.dart'
    as _i15;
import '../../presentation/presenters/search-page/search-page-presenter.dart'
    as _i11;
import '../../presentation/presenters/splash-page/splash-presenter.dart'
    as _i13;
import '../app/application-store.dart' as _i14;
import '../http/http-impl.dart' as _i6;
import '../local-storage/hive-storage.dart' as _i8;
import '../repositories/Favorite/favorite-repository.dart' as _i4;
import '../repositories/People/people-repository.dart' as _i9;
import '../repositories/Planet/planet-repository.dart' as _i10;
import '../repositories/Specie/specie-repository.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DetailsPagePresenter>(() => _i3.DetailsPagePresenter());
  gh.factory<_i4.FavoriteRepository>(() => _i4.FavoriteRepository());
  gh.factory<_i5.HttpClient>(() => _i6.HttpImpl());
  gh.factory<_i7.LocalStorage>(() => _i8.LocalStorageImpl());
  gh.factory<_i9.PeopleRepository>(() => _i9.PeopleRepository());
  gh.factory<_i10.PlanetRepository>(() => _i10.PlanetRepository());
  gh.factory<_i11.SearchPagePresenter>(() => _i11.SearchPagePresenter());
  gh.factory<_i12.SpecieRepository>(() => _i12.SpecieRepository());
  gh.factory<_i13.SplashPresenter>(() => _i13.SplashPresenter());
  gh.singleton<_i14.ApplicationStore>(_i14.ApplicationStore());
  gh.singleton<_i15.HomePagePresenter>(_i15.HomePagePresenter());
  return get;
}
