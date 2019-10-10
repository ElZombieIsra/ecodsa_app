import 'package:flutter/material.dart';
import 'package:ecodsa_app/globals.dart' as globals;
import 'package:ecodsa_app/style.dart' as Style;

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Image.asset(
            '${globals.kImagesUrl}logo@3x.png',
            fit: BoxFit.contain,
            width: screenSize.width / 6,
          ),
        ),
        FlatButton(
          // TODO: Implement Profile Route
          onPressed: () {},
          padding: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              // TODO: Implement user diferentiation
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Style.mutedColor,
                    borderRadius: BorderRadius.circular(20.0),
                    // TODO: Implement profile picture
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg",
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  width: 30.0,
                  height: 30.0,
                ),
                Container(
                  width: 10.0,
                ),
                Text(
                  "Usuario",
                  style: Style.userNameText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
