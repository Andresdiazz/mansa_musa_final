import 'package:flutter/material.dart';
import 'package:mansamusaapp/Classes/ui/screens/bachillerato/searchBachillerato.dart';
import 'package:mansamusaapp/Classes/ui/screens/preescolar/home_page.dart';

import '../../../../mansa_icon_icons.dart';
import '../selection_page.dart';
import 'components/tab_ejeTematico.dart';

class SecondPage extends StatefulWidget {
  final String id;

  final String title;
  final String img;
  final String description;
  final String subtitle;

  SecondPage({this.title, this.img, this.description, this.subtitle, this.id});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePagePreescolar()));
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
                      image: AssetImage("images/fondo.png"),
                      fit: BoxFit.cover)),
              child: TabEjeWidget(
                id: widget.id,
                title: widget.title,
                description: widget.description,
                subtitle: widget.subtitle,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
