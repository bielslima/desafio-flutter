// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search-page-presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchPagePresenter on _SearchPagePresenterBase, Store {
  final _$peoplesSrcAtom = Atom(name: '_SearchPagePresenterBase.peoplesSrc');

  @override
  List<People> get peoplesSrc {
    _$peoplesSrcAtom.reportRead();
    return super.peoplesSrc;
  }

  @override
  set peoplesSrc(List<People> value) {
    _$peoplesSrcAtom.reportWrite(value, super.peoplesSrc, () {
      super.peoplesSrc = value;
    });
  }

  final _$isSearchingPeoplesAtom =
      Atom(name: '_SearchPagePresenterBase.isSearchingPeoples');

  @override
  bool get isSearchingPeoples {
    _$isSearchingPeoplesAtom.reportRead();
    return super.isSearchingPeoples;
  }

  @override
  set isSearchingPeoples(bool value) {
    _$isSearchingPeoplesAtom.reportWrite(value, super.isSearchingPeoples, () {
      super.isSearchingPeoples = value;
    });
  }

  final _$_SearchPagePresenterBaseActionController =
      ActionController(name: '_SearchPagePresenterBase');

  @override
  void _setPeoples(List<People> pList) {
    final _$actionInfo = _$_SearchPagePresenterBaseActionController.startAction(
        name: '_SearchPagePresenterBase._setPeoples');
    try {
      return super._setPeoples(pList);
    } finally {
      _$_SearchPagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setIsSearchingPeoples(bool v) {
    final _$actionInfo = _$_SearchPagePresenterBaseActionController.startAction(
        name: '_SearchPagePresenterBase._setIsSearchingPeoples');
    try {
      return super._setIsSearchingPeoples(v);
    } finally {
      _$_SearchPagePresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
peoplesSrc: ${peoplesSrc},
isSearchingPeoples: ${isSearchingPeoples}
    ''';
  }
}
