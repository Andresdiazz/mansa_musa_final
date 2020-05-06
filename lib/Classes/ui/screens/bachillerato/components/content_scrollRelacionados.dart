import 'package:flutter/material.dart';

import '../model/clases_model.dart';
import '../secondPage.dart';
import '../thirdPage.dart';

class ContentScrollRelacionado extends StatelessWidget {
  final List<CardsPrincipal> images;
  final String title;
  final double imageHeight;
  final double imageWidth;
  final double padding;

  ContentScrollRelacionado({
    this.images,
    this.title,
    this.imageHeight,
    this.imageWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: padding),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 23, color: Color(0xffAC7830)),
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
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              //Portada port = portada[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (_) => ThirdPage(cardsTema: ejeTematicoList[index].temasRelacionadosList[index],)
                  ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  width: imageWidth,
                  height: imageHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(
                      image: AssetImage(ejeTematicoList[index].temasRelacionadosList[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}