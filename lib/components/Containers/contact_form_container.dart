import 'package:ecodsa_app/components/Buttons/rounded_button.dart';
import 'package:ecodsa_app/components/TextFields/contact_form_textfield.dart';
import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';
import 'package:ecodsa_app/globals.dart' as globals;

class ContactFormContainer extends StatefulWidget {
  @override
  _ContactFormContainerState createState() => _ContactFormContainerState();
}

class _ContactFormContainerState extends State<ContactFormContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Contáctanos",
              style: Style.mutedText(
                fontSize: 20,
                weight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(235, 237, 236, 1),
              borderRadius: BorderRadius.all(Radius.circular(49.0)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 37.0, vertical: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Nombre completo",
                  style: Style.mutedText(fontSize: 14.0),
                ),
                globals.separator(),
                ContactTextFormField(
                  hint: "Introducir nombre",
                ),
                globals.separator(),
                Text(
                  "Empresa",
                  style: Style.mutedText(fontSize: 14.0),
                ),
                globals.separator(),
                ContactTextFormField(
                  hint: "Introducir nombre",
                ),
                globals.separator(),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Teléfono",
                            style: Style.mutedText(fontSize: 14),
                          ),
                          globals.separator(),
                          ContactTextFormField(
                            hint: "00000",
                          )
                        ],
                      ),
                    ),
                    globals.separator(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Celular",
                            style: Style.mutedText(fontSize: 14),
                          ),
                          globals.separator(),
                          ContactTextFormField(
                            hint: "00000",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                globals.separator(),
                Text(
                  "Correo electrónico",
                  style: Style.mutedText(fontSize: 14.0),
                ),
                globals.separator(),
                ContactTextFormField(
                  hint: "ejemplo@ejem.com",
                ),
                globals.separator(height: 30.0),
                EcodsaRoundedButton(
                  height: 40.0,
                  width: 300.0,
                  fontSize: 16.0,
                  text: "Inscribirse",
                  onPressed: () {},
                ),
                globals.separator(),
                Center(
                  child: Text(
                    'Al presionar "Inscribirse" aceptas nuestros',
                    style: Style.mutedText(fontSize: 10.0),
                  ),
                ),
                Center(
                  child: Text(
                    "Términos y condiciones",
                    style: Style.primaryText(
                      fontSize: 10.0,
                      weight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
