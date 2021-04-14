import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popcode_challenge_swapi/infra/app/application-store.dart';
import 'package:popcode_challenge_swapi/infra/dependency-injection/injectable.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/home-page/home-page-presenter.dart';

class BottomSheetFilter extends StatefulWidget {
  @override
  _BottomSheetFilterState createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  HomePagePresenter _presenter = getIt<HomePagePresenter>();
  // bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    _toggleSwitch(bool v) {
      _presenter.setShowOnlyFavorites(v);
    }

    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
            // leading: new Icon(Icons.music_note),
            title: new Text('Show only favorites'),
            trailing: Observer(builder: (context) {
              return Switch(
                value: _presenter.showOnlyFavorites,
                onChanged: _toggleSwitch,
                activeTrackColor: Colors.yellow,
                activeColor: Colors.orangeAccent,
              );
            }),
            onTap: () => _toggleSwitch(!this._presenter.showOnlyFavorites),
          ),
        ],
      ),
    );
  }
}
