import 'package:flutter/material.dart';
import 'package:mansamusaapp/Classes/ui/screens/preescolar/tab_preescolar.dart';



class SecondPagePreescolar extends StatefulWidget {

   final String title;
  final String img;
  final String description;
  final String subtitle;



  SecondPagePreescolar({this.title,this.img,this.description,this.subtitle});

  @override
  _SecondPagePreescolarState createState() => _SecondPagePreescolarState();
}

class _SecondPagePreescolarState extends State<SecondPagePreescolar> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return [
              SliverAppBar(
                title: Text(widget.title.toUpperCase()),
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
                          fit: BoxFit.cover
                      )
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
                pinned: true,
                bottom: TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
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
                        Colors.white,
                        Colors.white
                      ],
                      radius: 1.0
                  )
              ),
              child: TabPreescolarWidget(
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