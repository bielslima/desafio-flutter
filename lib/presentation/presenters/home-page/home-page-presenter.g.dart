// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home-page-presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePagePresenter on _HomePagePresenterBase, Store {
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
  void _addPeoples(Iterable<People> elements) {
    final _$actionInfo = _$_HomePagePresenterBaseActionController.startAction(
        name: '_HomePagePresenterBase._addPeoples');
    try {
      return super._addPeoples(elements);
    } finally {
      _$_HomePagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setPeoples(List<People> _peoples) {
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
peoples: ${peoples},
isLoadingMorePeoples: ${isLoadingMorePeoples}
    ''';
  }
}
