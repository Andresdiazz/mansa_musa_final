import 'package:flutter/material.dart';

import '../../../../mansa_icon_icons.dart';
import '../chat/chat_page.dart';
import '../selection_page.dart';
import 'home_page.dart';

class ChatPrimaria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.transparent,
          title: Image.asset(
            "images/logos/logo-blanco.png",
            height: 70,
          ),
          actions: [
            IconButton(icon: Icon(MansaIcon.search), onPressed: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Theme.of(context).primaryColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: IconButton(
                      icon: Icon(MansaIcon.home),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePagePrimaria()));
                      },
                      color: Colors.white,
                      iconSize: 30),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.amber[200], Colors.orange[900]],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                  icon: Icon(MansaIcon.perfil),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectionPage()));
                  },
                  color: Colors.white,
                  iconSize: 30,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/fondo.png"), fit: BoxFit.cover)),
          child: Center(child: ChatPage()),
        ));
  }
}
