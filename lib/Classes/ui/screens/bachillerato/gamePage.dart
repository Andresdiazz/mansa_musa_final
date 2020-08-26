import 'package:flutter/material.dart';
import 'package:mansamusaapp/Classes/ui/screens/bachillerato/searchBachillerato.dart';

import '../../../../mansa_icon_icons.dart';
import '../selection_page.dart';
import 'components/tab_Game.dart';
import 'components/tab_ejeTematico.dart';
import 'home_page.dart';

class GamePage extends StatefulWidget {
  final int id;

  final String title;
  final String img;
  final String description;
  final String subtitle;

  GamePage({this.title, this.img, this.description, this.subtitle, this.id});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/logos/logo-blanco.png",
          height: 70,
        ),
        actions: [
          IconButton(
              icon: Icon(MansaIcon.search),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchBachillerato()));
              }),
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
              child: IconButton(
                icon: Icon(MansaIcon.home),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                color: Colors.white,
                iconSize: 30,
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SelectionPage()));
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
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                //title: Text(widget.title.toUpperCase()),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                        onTap: () {
                          print("play buton");
                        },
                        child: Icon(
                          Icons.image_aspect_ratio,
                          size: 20,
                        )),
                  )
                ],
                expandedHeight: 230,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.img), fit: BoxFit.fill)),
                  child: Container(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
                pinned: true,
                bottom: TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Color(0xffAC7830),
                    indicatorWeight: 3,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          "",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
              )
            ];
          },
          body: TabBarView(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/fondo.png"), fit: BoxFit.cover),
                  color: Colors.white),
              child: TabGameWidget(
                  title: widget.title,
                  description: widget.description,
                  id: widget.id),
            ),
          ]),
        ),
      ),
    );
  }
}
