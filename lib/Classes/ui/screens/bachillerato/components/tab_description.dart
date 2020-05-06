import 'package:flutter/material.dart';
import 'package:mansamusaapp/Classes/ui/screens/bachillerato/model/clases_model.dart';

import 'content_scroll.dart';
import 'content_scrollTemas.dart';

class TabDescriptionWidget extends StatelessWidget {

  final String title;
  final String description;

  TabDescriptionWidget({Key key, this.title, this.description});

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
            child: Text("Reproducir video", style: TextStyle(fontSize: 18),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
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
          child: Text(description, style: TextStyle(fontSize: 16, color: Colors.white, ),textAlign: TextAlign.justify,),
        ),
        ContentScrollTema(
          images: temasInteresList,
          title: 'Semejantes',
          imageHeight: 120.0,
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
