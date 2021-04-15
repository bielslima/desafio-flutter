import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../infra/app/application-store.dart';
import '../../../infra/dependency-injection/injectable.dart';
import '../../../infra/routes/routes.dart';
import '../../../presentation/presenters/search-page/search-page-presenter.dart';
import '../../../ui/constants.dart';
import './components/components.dart';

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
                                  this._presenter.peoplesSrc[index].id,
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
