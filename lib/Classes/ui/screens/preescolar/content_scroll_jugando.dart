import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mansamusaapp/Classes/ui/screens/preescolar/seconPagePreescolar.dart';


class ContentScrollJugandoPre extends StatelessWidget {
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScrollJugandoPre({
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
            child: StreamBuilder(
          stream: Firestore.instance.collection('preescolar').document('principal').collection('jugando').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (!snapshot.hasData) {  return Text("loading...."); }
              int length = snapshot.data.documents.length;

        return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: length,
            itemBuilder: (_, int index) {
                 final DocumentSnapshot doc = snapshot.data.documents[index];
                  return InkWell(
                onTap: (){
                  print(doc.documentID);
                        Navigator.push(context, MaterialPageRoute(
                    builder: (_) => SecondPagePreescolar(
                            title: doc.data['title'],
                            subtitle: doc.data['subtitle'],
                            description: doc.data['description'],
                            img:doc.data['img'],
                    )
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
                      image: NetworkImage( '${doc.data["img"]}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
      
          },
        )
            
            )
      ],
    );
  }
}
