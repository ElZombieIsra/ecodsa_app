import 'package:ecodsa_app/components/Buttons/rounded_button.dart';
import 'package:ecodsa_app/components/TextFields/contact_form_textfield.dart';
import 'package:ecodsa_app/components/appBar.dart';
import 'package:ecodsa_app/components/stain_header.dart';
import 'package:flutter/material.dart';

import 'package:ecodsa_app/globals.dart' as globals;
import 'package:ecodsa_app/style.dart' as Style;

class ProfileInfoScreen extends StatefulWidget {
  @override
  _ProfileInfoScreenState createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _rfcController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              CustomAppBar(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: StainHeader(
                  title: "Información",
                  subtitle: "Ingrese todos los datos solicitados",
                ),
              ),
              LabelText("Nombre completo"),
              ContactTextFormField(
                controller: _nameController,
                hint: "Introduzca su nombre",
              ),
              LabelText("Empresa"),
              ContactTextFormField(
                controller: _companyController,
                hint: "Introduzca el nombre de la empresa",
              ),
              LabelText("R.F.C."),
              ContactTextFormField(
                controller: _rfcController,
                hint: "Introduzca su RFC",
              ),
              LabelText("Correo electrónico"),
              ContactTextFormField(
                controller: _emailController,
                hint: "ejemplo@ejemplo.com",
              ),
              // TODO: Create birth date editor
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   mainAxisSize: MainAxisSize.max,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: <Widget>[
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         LabelText("Fecha mes"),
              //         DropdownButton(
              //           hint: Text("Mes"),
              //           items: <DropdownMenuItem>[

              //           ],
              //         )
              //       ],
              //     )
              //   ],
              // ),
              globals.separator(height: 20.0),
              EcodsaRoundedButton(
                text: "Guardar",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  final String text;
  const LabelText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: Style.mutedText(),
      ),
    );
  }
}
