import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/routes/routes.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/search-page/search-page-presenter.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/splash-page/splash-presenter.dart';
import 'package:popcode_challenge_swapi/ui/constants.dart';
import './components/header-page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ApplicationStore appControl = getIt<ApplicationStore>();
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
                            onTap: () {
                              appControl.navigateTo(
                                context,
                                RouterPaths.DETAILS.replaceAll(
                                  ':id',
                                  index.toString(),
                                ),
                                transitionType: TransitionType.fadeIn,
                              );
                            },
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
