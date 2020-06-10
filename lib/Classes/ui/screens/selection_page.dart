import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusaapp/Users/bloc/bloc_user.dart';

import '../../../onboarding.dart';


class SelectionPage extends StatefulWidget{

  final Color colorAppBar;
  final Color colorBackground;
  final AssetImage logo;
  final Color color;

  SelectionPage({Key key, this.color, this.colorBackground, this.colorAppBar, this.logo});

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);
    return Scaffold(
       appBar: AppBar(
         backgroundColor: widget.colorAppBar,
          title: Center(
            child: Container(width: 90, height: 90, decoration: BoxDecoration(
              image: DecorationImage(image: widget.logo)
            ),),
          ),
           actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app, color: widget.color,),
            onPressed: (){
              userBloc.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnboardingPage()));
            },
          )
        ],
         leading: Text(""),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: widget.colorBackground),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¡Dinos que quieres aprender!", style: TextStyle(fontSize: 23, color: widget.color, ),),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('/HomePagePreescolar');
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(image: AssetImage("images/img/PREESCOLAR.jpg"),
                                    fit: BoxFit.cover)),


                          ),
                        ),
                        Text("Preescolar", style: TextStyle(color: widget.color, fontSize: 20, fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('/HomePagePrimaria');
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(image: AssetImage("images/img/PRIMARIA.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Text("Primaria", style: TextStyle(color: widget.color, fontSize: 20, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/HomePageBachillerato');
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(image: AssetImage("images/img/BACHILLERATO.png"),
                                fit: BoxFit.cover)),

                      ),
                    ),
                    Text("Bachillerato", style: TextStyle(color: widget.color, fontSize: 20, fontWeight: FontWeight.bold),)
                  ],
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
