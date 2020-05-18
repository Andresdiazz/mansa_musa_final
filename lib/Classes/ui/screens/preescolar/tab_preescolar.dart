import 'package:flutter/material.dart';

import 'content_scroll_interes.dart';
import 'content_scroll_jugando.dart';
import 'content_scroll_preescolar.dart';



class TabPreescolarWidget extends StatefulWidget {

  final String title;
  final String description;
  final String subtitle;


  TabPreescolarWidget({Key key, this.title, this.description, this.subtitle});

  @override
  _TabPreescolarWidgetState createState() => _TabPreescolarWidgetState();
}

class _TabPreescolarWidgetState extends State<TabPreescolarWidget> {

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
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 30, color: Colors.black ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
                  height: 1.5,
                  decoration: BoxDecoration(color: Colors.black ),
                ))
          ],
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(widget.description, style: TextStyle(fontSize: 16, color: Colors.black, ),textAlign: TextAlign.justify,),
        ),
         ContentScrollEjePreescolar(
            title: 'Eje Temático',
            imageHeight: 120.0,
            imageWidth: 123.0,
          ),
          ContentScrollInteres(
            title: 'Temas de Interes',
              imageHeight: 250.0,
              imageWidth: 123.0,
            ),
            ContentScrollJugandoPre(
              title: 'Aprende Jugando',
              imageHeight: 120.0,
              imageWidth: 123.0,
            ),
      ],
    );
  }
}