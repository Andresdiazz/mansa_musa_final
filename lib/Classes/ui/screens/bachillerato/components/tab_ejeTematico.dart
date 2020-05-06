import 'package:flutter/material.dart';
import 'package:mansamusaapp/Classes/ui/screens/bachillerato/model/clases_model.dart';

import 'content_scroll.dart';
import 'content_scrollRelacionados.dart';
import 'content_scrollTemas.dart';

class TabEjeWidget extends StatefulWidget {



  final String title;
  final String description;
  final String subtitle;

  CardsPrincipal cards;

  TabEjeWidget({Key key, this.title, this.description, this.subtitle});

  @override
  _TabEjeWidgetState createState() => _TabEjeWidgetState();
}

class _TabEjeWidgetState extends State<TabEjeWidget> {

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
                style: TextStyle(fontSize: 30, color: Color(0xffAC7830)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
                  height: 1.5,
                  decoration: BoxDecoration(color: Color(0xffAC7830)),
                ))
          ],
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(widget.description, style: TextStyle(fontSize: 16, color: Colors.white, ),textAlign: TextAlign.justify,),
        ),
        ContentScrollTema(
          images: temasInteresList,
          title: widget.subtitle,
          imageHeight: 120.0,
          imageWidth: 123.0,
          padding: 10,
          paddingContainer: 0,

        ),
        ContentScrollTema(
          images: temasInteresList,
          title: 'Temas de Interés',
          imageHeight: 250.0,
          imageWidth: 123.0,
          padding: 10,
          paddingContainer: 0,

        ),
        ContentScrollEje(
          images: ejeTematicoList,
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
