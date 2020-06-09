import 'package:flutter/material.dart';

import 'components/tab_Game.dart';
import 'components/tab_ejeTematico.dart';

class GamePage extends StatefulWidget {

  final String id;

  final String title;
  final String img;
  final String description;
  final String subtitle;



  GamePage({this.title,this.img,this.description,this.subtitle, this.id});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return [
              SliverAppBar(
                //title: Text(widget.title.toUpperCase()),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(onTap: (){
                      print("play buton");
                    },child: Icon(Icons.image_aspect_ratio,size: 20,)),
                  )

                ],
                expandedHeight: 230,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.img),
                          fit: BoxFit.fill
                      )
                  ),
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
                        child: Text("", style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                      ),

                    ]),
              )
            ];
          },
          body: TabBarView(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Colors.black
                      ],
                      radius: 1.0
                  )
              ),
              child: TabGameWidget(
                title: widget.title,
                description: widget.description,
              ),
            ),

          ]),

        ),
      ),
    );
  }
}
