import 'package:ecodsa_app/blocs/app/bloc.dart';
import 'package:ecodsa_app/components/Containers/profile_image_container.dart';
import 'package:flutter/material.dart';
import 'package:ecodsa_app/globals.dart' as globals;
import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final AppBloc _appBloc = BlocProvider.of<AppBloc>(context);
    void _onPressed() {
      if (_appBloc.loggedIn)
        Navigator.pushNamed(context, '/profile');
      else
        Navigator.pushNamed(context, "/login");
    }

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
          onPressed: _onPressed,
          padding: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                EcodsaProfileImageContainer(
                  _appBloc.loggedIn
                      ? _appBloc.user.profileImage
                      : "https://png.pngtree.com/element_our/png/20181206/users-vector-icon-png_260862.jpg",
                  size: 30,
                ),
                Container(
                  width: 10.0,
                ),
                Text(
                  _appBloc.loggedIn ? _appBloc.user.name : "Ingresar",
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
