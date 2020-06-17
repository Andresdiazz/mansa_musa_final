import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";

  String _mailSend =  "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          elevation: 0,
        ),
        body: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                        Image.asset(
                          "images/logos/logo-blanco.png",
                          width: 250,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Enviaremos un link a tu correo para poder reestablecer tu contraseña",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                          decoration: InputDecoration(
                              labelText: "Email",
                              filled: true,
                              fillColor: Colors.black38,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white38,
                              ),
                              labelStyle: TextStyle(
                                  color: Colors.white38, fontSize: 12),
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          keyboardType: TextInputType.emailAddress,
                          //autovalidate: true,
                          autocorrect: false,
                          onSaved: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Este campo es obligatorio';
                            }
                          },
                        ),
                        if (_mailSend.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all( 8 ) ,
                            child: Text(
                              _mailSend ,
                              style: TextStyle(
                                color: Colors.red ,
                                fontWeight: FontWeight.bold ,
                              ) ,
                              textAlign: TextAlign.center ,
                            ) ,
                          ) ,
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            textColor: Theme.of(context).primaryColor,
                            onPressed: () {
                              if(_formKey.currentState.validate()){
                                _formKey.currentState.save( );
                                FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => print("Revisa tu correo"));
                                setState( () {
                                  _mailSend = "Email enviado correctamente";
                                } );
                              }
                            },
                            child: Text("Enviar"),
                          ),
                        ),
                      ]),
                    )))));
  }
}
