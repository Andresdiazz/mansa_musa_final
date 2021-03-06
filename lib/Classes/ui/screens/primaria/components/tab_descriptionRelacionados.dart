import 'package:flutter/material.dart';

import 'content_scroll.dart';
import 'content_scrollJugando.dart';
import 'content_scrollTemas.dart';
import 'package:auto_size_text/auto_size_text.dart';


class TabDescriptionRelWidget extends StatefulWidget {

  final String title;
  final String description;

  TabDescriptionRelWidget({Key key, this.title, this.description});

  @override
  _TabDescriptionRelWidgetState createState() => _TabDescriptionRelWidgetState();
}

class _TabDescriptionRelWidgetState extends State<TabDescriptionRelWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 20, right: 10),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RaisedButton(onPressed: (){
            print("play video");
          },
            child: Text("Reproducir video", style: TextStyle(fontSize: 18, color: Colors.white),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: Colors.deepOrangeAccent,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AutoSizeText(
                widget.title,
                style: TextStyle(fontSize: 30, color: Colors.white),
                maxFontSize: 30,
                minFontSize: 20,
                maxLines: 2,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
                  height: 1.5,
                  decoration: BoxDecoration(color: Colors.white)))
    ],
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(widget.description, style: TextStyle(fontSize: 16, color: Colors.white, ),textAlign: TextAlign.justify,),
        ),
        SizedBox(height: 10,),
        ContentScrollTema(
          //images: temasInteresList,
          title: 'Temas de Interes',
          imageHeight: 250.0,
          imageWidth: 123.0,
          padding: 10,
          paddingContainer: 0,

        ),
        ContentScrolJugando(
          //images: ejeTematicoList,
          title: 'Aprende Jugando',
          imageHeight: 120.0,
          imageWidth: 123.0,
          padding: 10,
          paddingContainer: 0,
        ),


      ],
    );

  }
}