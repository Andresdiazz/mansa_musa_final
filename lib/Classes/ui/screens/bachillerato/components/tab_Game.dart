import 'package:flutter/material.dart';
import 'package:mansamusaapp/Games/par/parPage.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'content_scroll.dart';
import 'content_scrollJugando.dart';
import 'content_scrollTemas.dart';


class TabGameWidget extends StatefulWidget {

  final String title;
  final String description;

  TabGameWidget({Key key, this.title, this.description});

  @override
  _TabGameWidgetState createState() => _TabGameWidgetState();
}

class _TabGameWidgetState extends State<TabGameWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 20, right: 10),
      children: [
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
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (_) => ParPage()
            ));
          },
            child: Text("Entra y Juega", style: TextStyle(fontSize: 18),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: Colors.deepOrangeAccent,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ContentScrolJugando(
          //images: ejeTematicoList,
          title: 'Aprende Jugando',
          imageHeight: 120.0,
          imageWidth: 123.0,
          padding: 10,
          paddingContainer: 0,
        ),
        SizedBox(height: 10.0),
        ContentScrollEje(
          title: 'Eje Temático',
          imageHeight: 120.0,
          imageWidth: 123.0,
          padding: 15,
          paddingContainer: 6,
        ),
        SizedBox(height: 10.0),
        ContentScrollTema(
          title: 'Temas de Interés',
          imageHeight: 250.0,
          imageWidth: 123.0,
          padding: 15,
          paddingContainer: 6,
        ),


      ],
    );

  }
}