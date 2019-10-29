import 'package:ecodsa_app/components/Buttons/rounded_button.dart';
import 'package:ecodsa_app/components/TextFields/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:ecodsa_app/style.dart' as Style;
import 'package:ecodsa_app/globals.dart' as globals;

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.6, 0.9],
              colors: [
                Color.fromRGBO(255, 255, 255, 1.0),
                Color.fromRGBO(220, 220, 220, 1),
                Color.fromRGBO(200, 200, 200, 1),
              ],
            ),
          ),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    child: Image.asset(
                      "assets/img/logo@3x.png",
                      // height: screenSize.height / 5,
                    ),
                  ),
                ),
                TabBar(
                  indicatorColor: Style.primaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.black,
                  unselectedLabelColor: Style.mutedColor,
                  tabs: <Widget>[
                    Text("Iniciar"),
                    Text("Registrarme"),
                  ],
                ),
                Flexible(
                  flex: 3,
                  child: _tabview(),
                ),
                FlatButton(
                  child: Text(
                    "Aviso de privacidad",
                    style: Style.mutedText(
                        fontSize: 12.0, weight: FontWeight.bold),
                  ),
                  onPressed: () => Navigator.pushNamed(context, "/terms"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Center(
                    child: Text(
                      "Idea | Diseño ©CInteractivo",
                      style: Style.mutedText(fontSize: 8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabview() {
    Widget _register = Column(
      children: <Widget>[
        EcodsaLoginTextfield(
          icon: Icon(Icons.person_outline),
          hint: "Nombre completo",
        ),
        globals.separator(height: 20.0),
        EcodsaLoginTextfield(
          icon: Icon(Icons.mail_outline),
          hint: "Email",
          keyboardType: TextInputType.emailAddress,
        ),
        globals.separator(height: 20.0),
        EcodsaLoginTextfield(
          icon: Icon(Icons.lock_outline),
          hint: "Contraseña",
          obscureText: true,
        ),
        globals.separator(height: 50.0),
        EcodsaRoundedButton(
          text: "Registrar",
          width: 500.0,
          height: 50.0,
          onPressed: () {},
        ),
      ],
    );
    Widget _login = Column(
      children: <Widget>[
        EcodsaLoginTextfield(
          icon: Icon(Icons.mail_outline),
          hint: "Email",
          keyboardType: TextInputType.emailAddress,
        ),
        globals.separator(height: 20.0),
        EcodsaLoginTextfield(
          icon: Icon(Icons.lock_outline),
          hint: "Contraseña",
          obscureText: true,
        ),
        globals.separator(height: 50.0),
        EcodsaRoundedButton(
          text: "Iniciar Sesión",
          width: 500.0,
          height: 50.0,
          onPressed: () {},
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: FlatButton(
            child: Text(
              "¿Olvidaste tu contraseña?",
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: TabBarView(
        children: <Widget>[
          _login,
          _register,
        ],
      ),
    );
  }
}
