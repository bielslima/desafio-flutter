import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/data/models/people-model/people.dart';
import 'package:popcode_challenge_swapi/ui/pages/home/components/feature.dart';

class PeopleWidget extends StatefulWidget {
  People people;
  PeopleWidget(this.people);

  @override
  _PeopleWidgetState createState() => _PeopleWidgetState();
}

class _PeopleWidgetState extends State<PeopleWidget> with AfterLayoutMixin {
  late bool isFavorite;
  bool loadingFavorite = true;

  @override
  void initState() {
    super.initState();
  }

  void afterFirstLayout(BuildContext c) async {
    this.isFavorite = await widget.people.isFavorite;
    setState(() {
      this.loadingFavorite = false;
    });
  }

  void toggleFavorite() async {
    setState(() => this.loadingFavorite = true);
    this.isFavorite = await widget.people.toggleFavorite(this.isFavorite);
    setState(() => this.loadingFavorite = false);
  }

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
                  widget.people.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.black),
                ),
              ),
              this.loadingFavorite
                  ? CircularProgressIndicator()
                  : IconButton(
                      icon: Icon(
                        this.isFavorite
                            ? Icons.star_rate_rounded
                            : Icons.star_outline_rounded,
                      ),
                      onPressed: toggleFavorite,
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
                  widget.people.gender,
                  valueStyle: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontWeight: FontWeight.w500),
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                ),
                FeatureWidget(
                  'Height',
                  widget.people.height,
                  valueStyle: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontWeight: FontWeight.w500),
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                ),
                FeatureWidget(
                  'Mass',
                  widget.people.mass,
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
