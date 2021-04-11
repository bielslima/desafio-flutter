// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/http/http.dart' as _i3;
import '../../presentation/presenters/splash-page/splash-presenter.dart' as _i6;
import '../app/application-store.dart' as _i7;
import '../http/http-impl.dart' as _i4;
import '../repositories/People/people-repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.HttpClient>(() => _i4.HttpImpl());
  gh.factory<_i5.PeopleRepository>(() => _i5.PeopleRepository());
  gh.factory<_i6.SplashPresenter>(() => _i6.SplashPresenter());
  gh.singleton<_i7.ApplicationStore>(_i7.ApplicationStore());
  return get;
}
