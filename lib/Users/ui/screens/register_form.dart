import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusaapp/Users/bloc/bloc_user.dart';
import 'package:mansamusaapp/onboarding.dart';

import 'register_screen.dart';
import '../widgets/widget_button.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>( );

  String email = "";
  String password = "";

  String _errorMessage = "";

  bool showPassword = false;

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of( context );
    return SignIn( );
  }


  Widget SignIn() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 50 ) ,
        child: Form(
          key: _formKey ,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.topLeft ,
                    child: Text(
                      "Ingresa a tu cuenta" ,
                      style: TextStyle(
                          color: Colors.white ,
                          fontSize: 20 ,
                          fontWeight: FontWeight.bold ) ,
                    ) ) ,
                SizedBox(
                  height: 20 ,
                ) ,
                TextFormField(
                  style: TextStyle( color: Colors.white70 , fontSize: 15 ) ,
                  decoration: InputDecoration(
                      labelText: "Email" ,
                      filled: true ,
                      fillColor: Colors.black38 ,
                      prefixIcon: Icon(
                        Icons.email ,
                        color: Colors.white38 ,
                      ) ,
                      labelStyle:
                      TextStyle( color: Colors.white38 , fontSize: 12 ) ,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular( 8 ) ,
                      ) ) ,
                  keyboardType: TextInputType.emailAddress ,
                  //autovalidate: true,
                  autocorrect: false ,
                  onSaved: (value) {
                    email = value;
                  } ,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                  } ,
                ) ,
                SizedBox(
                  height: 5 ,
                ) ,
                TextFormField(
                  style: TextStyle( color: Colors.white70 , fontSize: 15 ) ,
                  textCapitalization: TextCapitalization.words ,
                  decoration: InputDecoration(
                      labelText: 'Contraseña de 6 o más carácteres' ,
                      suffixIcon: IconButton(icon: Icon(showPassword?Icons.visibility:Icons.visibility_off), onPressed: (){
                        setState(() {
                          showPassword = !showPassword;
                        });
                      }),
                      labelStyle:
                      TextStyle( color: Colors.white38 , fontSize: 12 ) ,
                      filled: true ,
                      fillColor: Colors.black38 ,
                      prefixIcon: Icon(
                        Icons.lock ,
                        color: Colors.white38 ,
                      ) ,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular( 8 ) ,
                      ) ) ,
                  obscureText: !showPassword,

                  //autovalidate: true,
                  autocorrect: false ,
                  onSaved: (value) {
                    password = value;
                  } ,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                  } , ) ,
                Padding(
                  padding: EdgeInsets.symmetric( vertical: 5 ) ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch ,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        textColor: Theme.of(context).primaryColor ,
                        onPressed: () => _login( context ) ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center ,
                          children: <Widget>[
                            Text( "Crear Cuenta" ) ,
                            if (_loading)
                              Container(
                                height: 20 ,
                                width: 20 ,
                                margin: const EdgeInsets.only( left: 20 ) ,
                                child: CircularProgressIndicator( ) ,
                              )
                          ] ,
                        ) ,
                      ) ,
                      if (_errorMessage.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all( 8 ) ,
                          child: Text(
                            _errorMessage ,
                            style: TextStyle(
                              color: Colors.red ,
                              fontWeight: FontWeight.bold ,
                            ) ,
                            textAlign: TextAlign.center ,
                          ) ,
                        ) ,
                    ] ,
                  ) ,
                )
              ] ,
            ) ,
          ) ,
        ) ,
      ) ,
    );
  }

  _login(BuildContext context) async {
    if (!_loading) {
      if (_formKey.currentState.validate( )) {
        _formKey.currentState.save( );
        setState( () {
          _loading = true;
          _errorMessage = "";
        } );
        try {
          var user = await userBloc.createAccountEmail(email, password);
          Navigator.of(context).pop(context);
          Navigator.of(context).pushReplacementNamed('/home');
          return user != null;
        }catch (e){
          setState(() {
            _loading = false;
            //_errorMessage = "Email o contraseña incorrecta";
          });
          return e.message;
        }
      }
    }
  }

}




