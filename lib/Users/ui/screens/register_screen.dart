import 'package:flutter/material.dart';

import 'register_form.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/fondo.png"), fit: BoxFit.cover)),
        ),
        AppBar(
          title: Text(""),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: RegisterForm(),
        )
      ],
    ));
  }
}
