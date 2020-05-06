import 'package:flutter/material.dart';

import 'components/tab_description.dart';
import 'model/clases_model.dart';


class ThirdPage extends StatefulWidget {

  final CardsPrincipal cardsTema;

  ThirdPage({this.cardsTema});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
              return [
                SliverAppBar(
                  title: Text(widget.cardsTema.title.toUpperCase()),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(onTap: (){
                        print("play buton");
                      },child: Icon(Icons.play_circle_outline,size: 30,)),
                    )
                  ],
                  expandedHeight: 230,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.cardsTema.imageUrl),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(.6),
                    ),
                  ),
                  pinned: true,
                  bottom: TabBar(
                    labelColor: Colors.white,
                      indicatorColor: Color(0xffAC7830),
                      indicatorWeight: 3,


                      tabs: <Widget>[
                    Tab(
                      child: Text("Descripción", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Tab(
                      child: Text("Clase", style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Tab(
                      child: Text("Rubrica", style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                    )
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
                child: TabDescriptionWidget(
                  title: widget.cardsTema.title,
                  description: widget.cardsTema.description,
                ),
              ),
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
              ),Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Colors.black
                        ],
                        radius: 1.0
                    )
                ),
              )
            ]),

            ),
      ),
    );
  }
}
