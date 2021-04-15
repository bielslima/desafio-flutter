// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home-page-presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePagePresenter on _HomePagePresenterBase, Store {
  final _$showOnlyFavoritesAtom =
      Atom(name: '_HomePagePresenterBase.showOnlyFavorites');

  @override
  bool get showOnlyFavorites {
    _$showOnlyFavoritesAtom.reportRead();
    return super.showOnlyFavorites;
  }

  @override
  set showOnlyFavorites(bool value) {
    _$showOnlyFavoritesAtom.reportWrite(value, super.showOnlyFavorites, () {
      super.showOnlyFavorites = value;
    });
  }

  final _$peoplesAtom = Atom(name: '_HomePagePresenterBase.peoples');

  @override
  ObservableList<People> get peoples {
    _$peoplesAtom.reportRead();
    return super.peoples;
  }

  @override
  set peoples(ObservableList<People> value) {
    _$peoplesAtom.reportWrite(value, super.peoples, () {
      super.peoples = value;
    });
  }

  final _$peoplesFavoritesAtom =
      Atom(name: '_HomePagePresenterBase.peoplesFavorites');

  @override
  ObservableList<People> get peoplesFavorites {
    _$peoplesFavoritesAtom.reportRead();
    return super.peoplesFavorites;
  }

  @override
  set peoplesFavorites(ObservableList<People> value) {
    _$peoplesFavoritesAtom.reportWrite(value, super.peoplesFavorites, () {
      super.peoplesFavorites = value;
    });
  }

  final _$isLoadingMorePeoplesAtom =
      Atom(name: '_HomePagePresenterBase.isLoadingMorePeoples');

  @override
  bool get isLoadingMorePeoples {
    _$isLoadingMorePeoplesAtom.reportRead();
    return super.isLoadingMorePeoples;
  }

  @override
  set isLoadingMorePeoples(bool value) {
    _$isLoadingMorePeoplesAtom.reportWrite(value, super.isLoadingMorePeoples,
        () {
      super.isLoadingMorePeoples = value;
    });
  }

  final _$_HomePagePresenterBaseActionController =
      ActionController(name: '_HomePagePresenterBase');

  @override
  void setValueFavoriteToPeople(String idPeople, bool v) {
    final _$actionInfo = _$_HomePagePresenterBaseActionController.startAction(
        name: '_HomePagePresenterBase.setValueFavoriteToPeople');
    try {
      return super.setValueFavoriteToPeople(idPeople, v);
    } finally {
      _$_HomePagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowOnlyFavorites(bool v) {
    final _$actionInfo = _$_HomePagePresenterBaseActionController.startAction(
        name: '_HomePagePresenterBase.setShowOnlyFavorites');
    try {
      return super.setShowOnlyFavorites(v);
    } finally {
      _$_HomePagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _addPeoples(Iterable<People>? elements) {
    final _$actionInfo = _$_HomePagePresenterBaseActionController.startAction(
        name: '_HomePagePresenterBase._addPeoples');
    try {
      return super._addPeoples(elements);
    } finally {
      _$_HomePagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setPeoples(List<People>? _peoples) {
    final _$actionInfo = _$_HomePagePresenterBaseActionController.startAction(
        name: '_HomePagePresenterBase._setPeoples');
    try {
      return super._setPeoples(_peoples);
    } finally {
      _$_HomePagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setLoadingMorePeoples(bool v) {
    final _$actionInfo = _$_HomePagePresenterBaseActionController.startAction(
        name: '_HomePagePresenterBase._setLoadingMorePeoples');
    try {
      return super._setLoadingMorePeoples(v);
    } finally {
      _$_HomePagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showOnlyFavorites: ${showOnlyFavorites},
peoples: ${peoples},
peoplesFavorites: ${peoplesFavorites},
isLoadingMorePeoples: ${isLoadingMorePeoples}
    ''';
  }
}
