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
      appBar: AppBar(title: Text(""), elevation: 0,
      ),
      body:  Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
            body: LoginForm()),
      );
  }
}