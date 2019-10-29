import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';

class EcodsaLoginTextfield extends StatelessWidget {
  final String hint;
  final Icon icon;
  final Widget suffix;
  final TextInputType keyboardType;
  final bool obscureText;

  const EcodsaLoginTextfield({
    Key key,
    @required this.icon,
    this.hint,
    this.suffix,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        icon: icon,
        suffix: suffix,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Style.mutedColor),
        ),
      ),
    );
  }
}
