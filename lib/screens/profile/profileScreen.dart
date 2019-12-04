import 'package:ecodsa_app/blocs/app/bloc.dart';
import 'package:ecodsa_app/components/Buttons/rounded_button.dart';
import 'package:ecodsa_app/components/Containers/profile_image_container.dart';
import 'package:ecodsa_app/models/user.dart';
import 'package:ecodsa_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecodsa_app/style.dart' as Style;
import 'package:ecodsa_app/globals.dart' as globals;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AppBloc _appBloc;

  @override
  void initState() {
    _appBloc = BlocProvider.of<AppBloc>(context);
    if (!_appBloc.loggedIn) Navigator.pushReplacementNamed(context, '/login');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<User>(
          future: EcodsaApi().getUser(accessToken: _appBloc.user.accessToken),
          builder: (BuildContext ctx, snap) {
            if (snap.hasError) {
              return SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Ocurrió un error al conectarse al servidor"),
                    globals.separator(),
                    RaisedButton(
                      child: Text("Reintentar"),
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, "/profile"),
                    ),
                  ],
                ),
              );
            }
            if (!snap.hasData) {
              return SizedBox.expand(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            User _user = snap.data;
            _appBloc.user = _user;
            return ListView(
              padding: EdgeInsets.all(40.0),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: EcodsaProfileImageContainer(_user.profileImage),
                ),
                Center(
                  child: Text(
                    _user.name.toUpperCase(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                FlatButton(
                  child: Text(
                    "Cambiar nombre de usuario",
                    style: Style.mutedText(fontSize: 16.0),
                  ),
                  onPressed: () {},
                ),
                globals.separator(height: 20.0),
                EcodsaRoundedButton(
                  text: "Información de facturación",
                  onPressed: () {},
                ),
                EcodsaRoundedButton(
                  text: "Cambiar información",
                  onPressed: () {},
                ),
                EcodsaRoundedButton(
                  text: "Mis eventos",
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text(
                    "Cerrar sesión",
                    style: Style.primaryText(fontSize: 18.0),
                  ),
                  onPressed: () {
                    _appBloc.dispatch(UserLoggedOutAppEvent());
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text(
                    "Aviso de privacidad",
                    style: Style.mutedText(fontSize: 14.0),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/privacy'),
                ),
                Center(
                  child: Text(
                    "Idea | diseño ©CInteractivo",
                    style: Style.mutedText(fontSize: 10.0),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
