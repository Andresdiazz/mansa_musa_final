import 'package:flutter/material.dart';

import 'register_form.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""), elevation: 0, ),
      body:  Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: RegisterForm()),
      );
  }
}