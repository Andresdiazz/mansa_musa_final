import 'package:flutter/material.dart';

import 'content_scroll_primaria.dart';
import 'content_scroll_primaria_interes.dart';
import 'content_scroll_primaria_jugando.dart';



class TabPrimariaWidget extends StatefulWidget {

  final String title;
  final String description;
  final String subtitle;


  TabPrimariaWidget({Key key, this.title, this.description, this.subtitle});

  @override
  _TabPrimariaWidgetState createState() => _TabPrimariaWidgetState();
}

class _TabPrimariaWidgetState extends State<TabPrimariaWidget> {

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
         ContentScrollEjePrimaria(
            title: 'Eje Temático',
            imageHeight: 120.0,
            imageWidth: 123.0,
          ),
         ContentScrollIntPrimaria(
            title: 'Temas de Interes',
              imageHeight: 250.0,
              imageWidth: 123.0,
          ),
         ContentScrollJugPrimaria(
              title: 'Aprende Jugando',
              imageHeight: 120.0,
              imageWidth: 123.0,
          ),
      ],
    );
  }
}