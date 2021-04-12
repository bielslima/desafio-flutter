import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/search-page/search-page-presenter.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/splash-page/splash-presenter.dart';
import 'package:popcode_challenge_swapi/ui/constants.dart';
import './components/header-page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchPagePresenter _presenter = getIt<SearchPagePresenter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: UiConstants.PADDING_DEFAULT,
        ),
        child: Column(
          children: [
            HeaderPage(
              presenter: this._presenter,
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return this._presenter.isSearchingPeoples
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) => ListTile(
                            title: Text(
                              this._presenter.peoplesSrc[index].name,
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: this._presenter.peoplesSrc.length,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
