import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/details-page/details-page-presenter.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/home-page/home-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/components/app-header.dart';
import 'package:popcode_challenge_swapi/ui/constants.dart';
import 'package:popcode_challenge_swapi/ui/utils/screen-helper.dart';

class DetailsPage extends StatefulWidget {
  final int indexPeople;
  DetailsPage(this.indexPeople);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with AfterLayoutMixin<DetailsPage> {
  final HomePagePresenter _homePagePresenter = getIt<HomePagePresenter>();
  final DetailsPagePresenter _presenter = getIt<DetailsPagePresenter>();
  final Duration durationAnimation = Duration(milliseconds: 300);

  late final People _people;

  @override
  void initState() {
    super.initState();
    this._people = this._homePagePresenter.peoples[widget.indexPeople];
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _presenter.initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(
            backButton: true,
          ),
          Container(
            width: ScreenHelper.screenWidth(context),
            height: 100,
            child: Stack(
              children: [
                Observer(builder: (context) {
                  return AnimatedPositioned(
                    duration: durationAnimation,
                    curve: Curves.decelerate,
                    child: Container(
                      padding:
                          EdgeInsets.only(left: UiConstants.PADDING_DEFAULT),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            this._people.name,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                          ),
                        ],
                      ),
                      width: ScreenHelper.screenWidth(context),
                    ),
                    left: _presenter.x,
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: ScreenHelper.screenWidth(context),
              child: Stack(
                children: [
                  Observer(builder: (context) {
                    return AnimatedPositioned(
                      duration: durationAnimation,
                      curve: Curves.decelerate,
                      child: Container(
                        padding:
                            EdgeInsets.only(left: UiConstants.PADDING_DEFAULT),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              this._people.name,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                        width: ScreenHelper.screenWidth(context),
                      ),
                      right: _presenter.x2,
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
