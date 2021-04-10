import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/ui/constants.dart';
import 'package:popcode_challenge_swapi/ui/utils/screen-helper.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double x = -200, x2 = -200;
  final Duration durationAnimation = Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            width: ScreenHelper.screenWidth(context),
            height: 400,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: durationAnimation,
                  curve: Curves.decelerate,
                  child: Container(
                    padding: EdgeInsets.only(left: UiConstants.PADDING_DEFAULT),
                    child: Text(
                      'Luke Skywalker',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                    width: ScreenHelper.screenWidth(context) * .5,
                    height: 350,
                  ),
                  left: x,
                ),
                AnimatedPositioned(
                  duration: durationAnimation,
                  curve: Curves.decelerate,
                  child: Container(
                    child: Image.asset(
                      'lib/ui/assets/images/1.png',
                      fit: BoxFit.cover,
                    ),
                    width: ScreenHelper.screenWidth(context) * .5,
                    height: 350,
                  ),
                  right: x2,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                x = 0;
                x2 = 0;
              });
            },
            child: Text('Start animation'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                x = -200;
                x2 = -200;
              });
            },
            child: Text('Reset animation'),
          )
        ],
      ),
    );
  }
}
