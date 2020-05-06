import 'package:flutter/material.dart';

import 'register_form.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset("images/logos/logo3.png", height: 140, width: 140,), elevation: 0, ),
      body:  Scaffold(body: Container(decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
        ),child: RegisterForm())),
      );
  }
}