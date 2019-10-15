import 'package:flutter/material.dart';
import 'package:ecodsa_app/style.dart' as Style;

class EcodsaRoundedButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  EcodsaRoundedButton({
    Key key,
    this.onPressed,
    @required this.text,
  }) : super(key: key);

  _EcodsaRoundedButtonState createState() => _EcodsaRoundedButtonState();
}

class _EcodsaRoundedButtonState extends State<EcodsaRoundedButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 10.0,
      child: RaisedButton(
        color: Style.primaryColor,
        elevation: 5.0,
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            color: Style.textColorPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
