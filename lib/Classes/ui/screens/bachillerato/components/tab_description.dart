import 'package:flutter/material.dart';
import 'package:mansamusaapp/Classes/ui/screens/bachillerato/VideoPage.dart';

import 'content_scroll.dart';
import 'content_scrollJugando.dart';
import 'content_scrollTemas.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TabDescriptionWidget extends StatefulWidget {
  final String title;
  final String description;

  TabDescriptionWidget({Key key, this.title, this.description});

  @override
  _TabDescriptionWidgetState createState() => _TabDescriptionWidgetState();
}

class _TabDescriptionWidgetState extends State<TabDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 20, right: 10),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RaisedButton(
            onPressed: () {
              print("play video");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VideoPage()));
            },
            child: Text(
              "Reproducir video",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
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
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ContentScrollTema(
          //images: temasInteresList,
          title: 'Semejantes',
          imageHeight: 140.0,
          imageWidth: 183.0,
          padding: 10,
          paddingContainer: 0,
        ),
        ContentScrolJugando(
          //images: ejeTematicoList,
          title: 'Aprende Jugando',
          imageHeight: 140.0,
          imageWidth: 183.0,
          padding: 10,
          paddingContainer: 0,
        ),
      ],
    );
  }
}
