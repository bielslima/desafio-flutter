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
    _presenter.findHomeWorldAndSpecies(
        this._people.homeworld, this._people.species);
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
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Height:',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' ${this._people.height}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Mass:',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' ${this._people.mass}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Hair Color:',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' ${this._people.hairColor}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Skin Color:',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' ${this._people.skinColor}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Eye Color:',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' ${this._people.eyeColor}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Birth year:',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' ${this._people.birthYear}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Gender:',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' ${this._people.gender}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Observer(builder: (_) {
                                    return this
                                            ._presenter
                                            .isFetchingPlanetAndSpecie
                                        ? Row(
                                            children: [
                                              Text(
                                                "Searching home world  ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                              SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ],
                                          )
                                        : RichText(
                                            text: TextSpan(
                                              text: 'Home world:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      ' ${this._presenter.planet?.name ?? 'Unknown'}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                )
                                              ],
                                            ),
                                          );
                                  }),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Observer(builder: (_) {
                                    return this
                                            ._presenter
                                            .isFetchingPlanetAndSpecie
                                        ? Row(
                                            children: [
                                              Text(
                                                "Searching specie  ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                              SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ],
                                          )
                                        : RichText(
                                            text: TextSpan(
                                              text: 'Specie:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      ' ${this._presenter.specie?.name ?? 'Unknown'}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                )
                                              ],
                                            ),
                                          );
                                  }),
                                ),
                              ],
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
