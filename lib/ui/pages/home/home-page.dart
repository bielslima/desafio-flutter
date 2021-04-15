import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/infra/routes/routes.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/home-page/home-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/components/app-header.dart';

import '../../constants.dart';
import 'components/components.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApplicationStore appControl = getIt<ApplicationStore>();
  final HomePagePresenter presenter = getIt<HomePagePresenter>();

  // late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // this._scrollController = new ScrollController();
    this.presenter.loadingAllPeoples();
  }

  @override
  void dispose() {
    super.dispose();
    // this._scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: UiConstants.COLOR_BACKGROUND,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppHeader(
              title: Logo(),
              searchIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () => appControl.navigateTo(
                  context,
                  RouterPaths.SEARCH,
                  transitionType: TransitionType.fadeIn,
                ),
              ),
              action: IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () => this._showFilters(context),
              ),
            ),
            Expanded(
              child: _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilters(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => BottomSheetFilter(),
    );
  }

  Widget _buildListView() {
    return Observer(
      builder: (_) {
        return ListView.separated(
          shrinkWrap: true,
          // controller: this._scrollController,
          itemBuilder: (context, index) {
            People people = this.presenter.showOnlyFavorites
                ? presenter.peoplesFavorites[index]
                : presenter.peoples[index];
            return InkWell(
                child: PeopleWidget(people),
                onTap: () {
                  appControl.navigateTo(
                    context,
                    RouterPaths.DETAILS.replaceAll(
                      ':id',
                      people.id,
                    ),
                    transitionType: TransitionType.fadeIn,
                  );

                  print('Selected id: $index');
                  // print();
                });
          },
          itemCount: this.presenter.showOnlyFavorites
              ? presenter.peoplesFavorites.length
              : presenter.peoples.length,
          separatorBuilder: (_, i) => SizedBox(
            height: 10,
          ),
          padding: EdgeInsets.only(
            right: 10,
            left: 10,
            bottom: 10,
          ),
        );
      },
    );
  }
}
