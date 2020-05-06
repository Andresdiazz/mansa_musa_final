import 'package:flutter/material.dart';
import 'package:mansamusaapp/Classes/ui/screens/preescolar/seconPagePreescolar.dart';

import 'model/clases_model_preescolar.dart';

class ContentScrollEjePreescolar extends StatelessWidget {
  final List<CardsPreescolar> images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScrollEjePreescolar({
    this.images,
    this.title,
    this.imageHeight,
    this.imageWidth,
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
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 23, color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 1.5,
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
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
                    builder: (_) => SecondPagePreescolar(card: ejeTematicoListPreescolar[index],)
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
                      image: NetworkImage(ejeTematicoListPreescolar[index].imageUrl),
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
