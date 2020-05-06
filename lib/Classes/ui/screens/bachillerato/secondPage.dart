import 'package:flutter/material.dart';

import 'components/tab_description.dart';
import 'components/tab_ejeTematico.dart';
import 'model/clases_model.dart';


class SecondPage extends StatefulWidget {

  final CardsPrincipal cards;

  SecondPage({this.cards});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {

    final String port = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return [
              SliverAppBar(
                title: Text(widget.cards.title.toUpperCase()),
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
                          image: AssetImage(widget.cards.imageUrl),
                          fit: BoxFit.cover
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
              child: TabEjeWidget(
                title: widget.cards.title,
                description: widget.cards.description,
                subtitle: widget.cards.subtitle,
              ),
            ),

          ]),

        ),
      ),
    );
  }
}