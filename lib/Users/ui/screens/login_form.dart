import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusaapp/Classes/ui/screens/selection_page.dart';
import 'package:mansamusaapp/Users/bloc/bloc_user.dart';
import 'package:mansamusaapp/Users/model/user.dart';
import 'package:mansamusaapp/onboarding.dart';

import 'register_screen.dart';
import '../widgets/widget_button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 50 ) ,
      child: Form(
        key: _formKey ,
        child: SingleChildScrollView(
          child: Column(

            children: <Widget>[
              Image.asset("images/logos/logo-blanco.png", width: 250,),
              SizedBox(height: 50,),
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
                          Text( "Iniciar sesión" ) ,
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
                    WidgetButton(
                      onPressed: () => _loginGoogle( context ) ,
                      title: " Inicia Sesión con Google" ,
                    ) ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      children: <Widget>[
                        Text(
                          "¿Aún no tienes cuenta?" ,
                          style: TextStyle( color: Colors.white ) ,
                        ) ,
                        FlatButton(
                          child: Text(
                            'Crear cuenta' ,
                            style: TextStyle(
                                fontWeight: FontWeight.bold ,
                                fontSize: 15 ,
                                color: Color( 0xffC48934 ) ) ,
                          ) ,
                          onPressed: () {
                            Navigator.push( context , MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RegisterScreen( ) ) );
                          } ,
                        ) ,
                      ] ,
                    )
                  ] ,
                ) ,
              )
            ] ,
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
         var user = await userBloc.signInEmail(email, password).then((FirebaseUser user){
           userBloc.updateUserData(User(
             uid: user.uid,
             email: user.email,
             name: user.displayName
           ));
         });
         Navigator.of(context).pop(context);
         Navigator.of(context).pushReplacementNamed('/home');
         return user != null;
       }catch (e){
         setState(() {
           _loading = false;
           _errorMessage = "Email o contraseña incorrecta";
         });
         return e.message;
       }
      }
    }
  }

  _loginGoogle(BuildContext context) async
  {
    if (!_loading) {
        setState( () {
          _loading = true;
          _errorMessage = "";
        } );
        try {
          var user = await userBloc.signInWithGoogle().then((FirebaseUser user){
            userBloc.updateUserData(User(
                uid: user.uid,
                email: user.email,
                name: user.displayName
            ));
          });
          Navigator.of(context).pop(context);
          Navigator.of(context).pushReplacementNamed('/home');
          return user != null;
        }catch (e){
          setState(() {
            _loading = false;
            _errorMessage = "Email o contraseña incorrecta";
          });
          return e.message;
        }

    }
  }

}



