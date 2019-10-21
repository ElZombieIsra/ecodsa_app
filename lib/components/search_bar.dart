import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';

class EcodsaSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width - 50,
      transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.horizontal(right: Radius.circular(50.0)),
        child: Container(
          padding: EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Style.mutedColor,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
