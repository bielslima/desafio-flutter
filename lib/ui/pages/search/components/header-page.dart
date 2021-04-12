import 'package:flutter/material.dart';
import 'package:popcode_challenge_swapi/presentation/presenters/search-page/search-page-presenter.dart';
import 'package:popcode_challenge_swapi/ui/utils/screen-helper.dart';

class HeaderPage extends StatelessWidget {
  final SearchPagePresenter presenter;

  HeaderPage({
    required this.presenter,
  });

  final TextEditingController txtController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context) * .1,
      margin: EdgeInsets.only(top: ScreenHelper.screenHeight(context) * .07),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Icon(
              Icons.arrow_back_ios,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                controller: this.txtController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search a people...',
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                    child: Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(0.5),
                      size: 18,
                    ),
                    onTap: () =>
                        presenter.searchExpression(this.txtController.text),
                  ),
                ),
                // onChanged: presenter.searchExpression,
                onFieldSubmitted: presenter.searchExpression,
                // onEditingComplete: presenter.searchExpression,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
