// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details-page-presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsPagePresenter on _DetailsPagePresenterBase, Store {
  final _$isFetchingPlanetAndSpecieAtom =
      Atom(name: '_DetailsPagePresenterBase.isFetchingPlanetAndSpecie');

  @override
  bool get isFetchingPlanetAndSpecie {
    _$isFetchingPlanetAndSpecieAtom.reportRead();
    return super.isFetchingPlanetAndSpecie;
  }

  @override
  set isFetchingPlanetAndSpecie(bool value) {
    _$isFetchingPlanetAndSpecieAtom
        .reportWrite(value, super.isFetchingPlanetAndSpecie, () {
      super.isFetchingPlanetAndSpecie = value;
    });
  }

  final _$isLoadingPeopleAtom =
      Atom(name: '_DetailsPagePresenterBase.isLoadingPeople');

  @override
  bool get isLoadingPeople {
    _$isLoadingPeopleAtom.reportRead();
    return super.isLoadingPeople;
  }

  @override
  set isLoadingPeople(bool value) {
    _$isLoadingPeopleAtom.reportWrite(value, super.isLoadingPeople, () {
      super.isLoadingPeople = value;
    });
  }

  final _$peopleAtom = Atom(name: '_DetailsPagePresenterBase.people');

  @override
  People get people {
    _$peopleAtom.reportRead();
    return super.people;
  }

  @override
  set people(People value) {
    _$peopleAtom.reportWrite(value, super.people, () {
      super.people = value;
    });
  }

  final _$specieAtom = Atom(name: '_DetailsPagePresenterBase.specie');

  @override
  Specie? get specie {
    _$specieAtom.reportRead();
    return super.specie;
  }

  @override
  set specie(Specie? value) {
    _$specieAtom.reportWrite(value, super.specie, () {
      super.specie = value;
    });
  }

  final _$planetAtom = Atom(name: '_DetailsPagePresenterBase.planet');

  @override
  Planet? get planet {
    _$planetAtom.reportRead();
    return super.planet;
  }

  @override
  set planet(Planet? value) {
    _$planetAtom.reportWrite(value, super.planet, () {
      super.planet = value;
    });
  }

  final _$xAtom = Atom(name: '_DetailsPagePresenterBase.x');

  @override
  double get x {
    _$xAtom.reportRead();
    return super.x;
  }

  @override
  set x(double value) {
    _$xAtom.reportWrite(value, super.x, () {
      super.x = value;
    });
  }

  final _$x2Atom = Atom(name: '_DetailsPagePresenterBase.x2');

  @override
  double get x2 {
    _$x2Atom.reportRead();
    return super.x2;
  }

  @override
  set x2(double value) {
    _$x2Atom.reportWrite(value, super.x2, () {
      super.x2 = value;
    });
  }

  final _$_DetailsPagePresenterBaseActionController =
      ActionController(name: '_DetailsPagePresenterBase');

  @override
  dynamic _setAnimation(double x, double x2) {
    final _$actionInfo = _$_DetailsPagePresenterBaseActionController
        .startAction(name: '_DetailsPagePresenterBase._setAnimation');
    try {
      return super._setAnimation(x, x2);
    } finally {
      _$_DetailsPagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setPlanet(Planet p) {
    final _$actionInfo = _$_DetailsPagePresenterBaseActionController
        .startAction(name: '_DetailsPagePresenterBase._setPlanet');
    try {
      return super._setPlanet(p);
    } finally {
      _$_DetailsPagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setSpecie(Specie s) {
    final _$actionInfo = _$_DetailsPagePresenterBaseActionController
        .startAction(name: '_DetailsPagePresenterBase._setSpecie');
    try {
      return super._setSpecie(s);
    } finally {
      _$_DetailsPagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setIsFetchingPlanetAndSpecie(bool v) {
    final _$actionInfo =
        _$_DetailsPagePresenterBaseActionController.startAction(
            name: '_DetailsPagePresenterBase._setIsFetchingPlanetAndSpecie');
    try {
      return super._setIsFetchingPlanetAndSpecie(v);
    } finally {
      _$_DetailsPagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setIsLoadingPeople(bool v) {
    final _$actionInfo = _$_DetailsPagePresenterBaseActionController
        .startAction(name: '_DetailsPagePresenterBase._setIsLoadingPeople');
    try {
      return super._setIsLoadingPeople(v);
    } finally {
      _$_DetailsPagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setPeople(People p) {
    final _$actionInfo = _$_DetailsPagePresenterBaseActionController
        .startAction(name: '_DetailsPagePresenterBase._setPeople');
    try {
      return super._setPeople(p);
    } finally {
      _$_DetailsPagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFetchingPlanetAndSpecie: ${isFetchingPlanetAndSpecie},
isLoadingPeople: ${isLoadingPeople},
people: ${people},
specie: ${specie},
planet: ${planet},
x: ${x},
x2: ${x2}
    ''';
  }
}
