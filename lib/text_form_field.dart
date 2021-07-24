import 'package:flutter/material.dart';

class LoginTextFormField extends StatelessWidget {
  LoginTextFormField(
      {this.labelText, this.helperText, this.invisible, this.validateFunction});

  final String labelText;
  final String helperText;
  final bool invisible;
  final Function validateFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: invisible,
      decoration: InputDecoration(
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.indigo,
            ),
            borderRadius: BorderRadius.circular(
              10.0,
            ), // BorderRadius.circular
          ), // OutLineInputBorder
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.grey,
            ), // BorderSide
            borderRadius: BorderRadius.circular(5.0),
          ), // OutLineInputBorder
          helperText: helperText,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      ), // InputDecoration
      validator: validateFunction,
    ); // TextFormField
  }
}
