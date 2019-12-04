import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';

class EcodsaRoundedButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  final double height;
  final double width;
  final double fontSize;
  EcodsaRoundedButton({
    Key key,
    this.onPressed,
    @required this.text,
    this.height = 20.0,
    this.width = 50.0,
    this.fontSize = 18.0,
  }) : super(key: key);

  _EcodsaRoundedButtonState createState() => _EcodsaRoundedButtonState();
}

class _EcodsaRoundedButtonState extends State<EcodsaRoundedButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: widget.height,
      minWidth: widget.width,
      child: RaisedButton(
        color: Style.primaryColor,
        elevation: 5.0,
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        onPressed: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Style.textColorPrimary,
              fontWeight: FontWeight.w600,
              fontSize: widget.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
