import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  // final ApplicationStore appControl = getIt<ApplicationStore>();
  final HomePagePresenter presenter = getIt<HomePagePresenter>();

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    this._scrollController = new ScrollController();
    this._scrollController.addListener(
        () => this.presenter.listenerScroll(this._scrollController));
  }

  @override
  void dispose() {
    super.dispose();
    this._scrollController.dispose();
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
              action: IconButton(
                icon: Icon(Icons.search),
                onPressed: () => this.presenter.btnSearchPeople(context),
              ),
            ),
            Expanded(
              child: Scrollbar(
                controller: this._scrollController,
                child: _buildListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Observer(
      builder: (_) => ListView.separated(
        controller: this._scrollController,
        itemBuilder: (context, i) {
          if (i == this.presenter.peoples.length) {
            return Center(
                child: Observer(
              builder: (_) => this.presenter.isLoadingMorePeoples
                  ? CircularProgressIndicator()
                  : Container(),
            ));
          } else {
            return InkWell(
              child: PeopleWidget(presenter.peoples[i]),
              onTap: () => this.presenter.showDetails(context, i),
            );
          }
        },
        itemCount: presenter.peoples.length + 1,
        separatorBuilder: (_, i) => SizedBox(
          height: 10,
        ),
        padding: EdgeInsets.only(
          right: 10,
          left: 10,
          bottom: 10,
        ),
      ),
    );
  }
}
