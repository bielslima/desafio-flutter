import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/ui/constants.dart';
import './components/header-page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: UiConstants.PADDING_DEFAULT,
        ),
        child: Column(
          children: [
            HeaderPage(),
          ],
        ),
      ),
    );
  }
}
