import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/ui/pages/home/components/feature.dart';

class PeopleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Luke Skywallker',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.black),
                ),
              ),
              IconButton(
                icon: Icon(Icons.star_border),
                onPressed: () {
                  print("set favorite");
                },
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FeatureWidget(
                  'Gender',
                  'Male',
                  valueStyle: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontWeight: FontWeight.w500),
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                ),
                FeatureWidget(
                  'Height',
                  '35,5',
                  valueStyle: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontWeight: FontWeight.w500),
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                ),
                FeatureWidget(
                  'Mass',
                  '35,5',
                  valueStyle: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontWeight: FontWeight.w500),
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
