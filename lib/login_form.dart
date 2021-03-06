import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constants.dart';
import 'text_form_field.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       ), // AppBar
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 25,
                    ), // EdgeInsets

                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Login', style: kLogoutStyle),
                    ), // Align
                  ), // Padding

                  //************************ name text form field
                  //*************************************************
                  LoginTextFormField(
                    labelText: 'Name',
                     helperText: 'Enter your name',
                    invisible: false,
                    validateFunction: (var value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter your name';
                      } else {
                        return null;
                      }
                    },
                  ), // LoginTextFormField

                  SizedBox(
                    height: 30,
                  ),

                  //****************************** password text form field
                  //*********************************************************
                  LoginTextFormField(
                    labelText: 'password',
                       helperText: 'Enter your password',
                    invisible: true,
                    validateFunction: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter your password';
                      } else {
                        return null;
                      }
                    },
                  ), // LoginTextFormField

                  SizedBox(
                    height: 20,
                  ),

                    //************************* login button
                   //********************************************
                  Container(

                    child: ElevatedButton(
                      child: Text('login'),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title:
                                      Text('Are you sure you want to sign in?'),
                                  //content: Text('hi'),
                                  actions: [
                                    //********************** cancel button
                                    //*******************************************
                                    TextButton(
                                        onPressed: () {
                                          // Navigator.pop(context);
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return LoginForm();
                                          }));
                                        },
                                        child: Text('cancel'),
                                    ), // TextButton

                                    //************************ ok button
                                    //*******************************************
                                    TextButton(
                                        onPressed: () {
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  ' you are successfully login, '));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          Navigator.pop(context);
                                        },
                                        child: Text('ok'),
                                    ), // TextButton

                                  ],
                                );
                              });
                        }
                      },
                    ),
                  ), //ElevatedButton
                ],
              ), //Column
            ), //SingleChildScrollView
          ), // Form
        ), //Container
      ), // Center
    ); // Scaffold
  }
}
