import 'package:flutter/material.dart';
import 'package:ecodsa_app/globals.dart' as globals;
import 'package:ecodsa_app/style.dart' as Style;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFooter extends StatefulWidget {
  @override
  _CustomFooterState createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: screenSize.width / 8,
          child: Image.asset(
            '${globals.kImagesUrl}logo@3x.png',
            fit: BoxFit.contain,
          ),
        ),
        Expanded(child: Container()),
        Text(
          "+52(55) 5599 2860",
          style: Style.mutedText(fontSize: 13.0),
        ),
        // VerticalDivider(
        //   color: Colors.red,
        //   width: 20.0,
        // ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          width: 1.0,
          height: 50.0,
          color: Style.primaryColor,
        ),
        Column(
          children: <Widget>[
            Text(
              "Nuestras redes",
              style: Style.mutedText(fontSize: 12.0),
            ),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.facebookSquare,
                  color: Style.mutedColor,
                  size: 20.0,
                ),
                Icon(
                  FontAwesomeIcons.twitterSquare,
                  color: Style.mutedColor,
                  size: 20.0,
                ),
                Icon(
                  FontAwesomeIcons.instagram,
                  color: Style.mutedColor,
                  size: 20.0,
                ),
                Icon(
                  FontAwesomeIcons.youtube,
                  color: Style.mutedColor,
                  size: 20.0,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
