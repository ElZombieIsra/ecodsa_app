import 'package:flutter/material.dart';

class ContactTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;

  const ContactTextFormField({Key key, this.controller, this.hint})
      : super(key: key);
  @override
  _ContactTextFormFieldState createState() => _ContactTextFormFieldState();
}

class _ContactTextFormFieldState extends State<ContactTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller ?? TextEditingController(),
      decoration: InputDecoration(
        hintText: widget.hint,
        border: InputBorder.none,
        fillColor: Color.fromRGBO(225, 227, 226, 1),
        filled: true,
      ),
    );
  }
}
