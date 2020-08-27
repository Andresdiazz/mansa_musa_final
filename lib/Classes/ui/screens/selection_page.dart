import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusaapp/Users/bloc/bloc_user.dart';

import '../../../mansa_icon_icons.dart';
import '../../../onboarding.dart';
import 'bachillerato/ChatPage.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/fondo.png"), fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 230,
                    width: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logos/logo-blanco.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 290),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Theme.of(context).primaryColor
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(MansaIcon.chat),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Chat()));
                            },
                            color: Colors.white,
                            iconSize: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Theme.of(context).primaryColor
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(8)),
                          child: IconButton(
                            icon: Icon(Icons.exit_to_app),
                            onPressed: () {
                              userBloc.signOut();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OnboardingPage()));
                            },
                            color: Colors.white,
                            iconSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "¡Dinos que quieres aprender!",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/HomePagePreescolar');
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: AssetImage("images/img/3.png"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Text(
                            "Preescolar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/HomePagePrimaria');
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: AssetImage("images/img/GIRL.png"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Text(
                            "Primaria",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/HomePageBachillerato');
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage("images/img/KID.png"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Text(
                        "Bachillerato",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
