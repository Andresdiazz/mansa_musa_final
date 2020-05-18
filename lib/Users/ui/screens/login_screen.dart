import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusaapp/Users/bloc/bloc_user.dart';
import 'package:mansamusaapp/Users/ui/screens/login_form.dart';


class LoginScreen extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Image.asset("images/logos/logo-blanco.png", height: 140, width: 140,), elevation: 0,
      ),
      body:  Scaffold(
            body: Container(decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
            ),child: Center(child: LoginForm()))),
      );
  }
}