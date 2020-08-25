import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../secondPage.dart';

class ContentScrollEje extends StatelessWidget {
  final String title;
  final double imageHeight;
  final double imageWidth;
  final double padding;
  final double paddingContainer;

  ContentScrollEje(
      {this.title,
      this.imageHeight,
      this.imageWidth,
      this.padding,
      this.paddingContainer});

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
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 1.5,
                decoration: BoxDecoration(color: Colors.white),
              ))
            ],
          ),
        ),
        Container(
            height: imageHeight,
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection('bachillerato')
                  .document('principal')
                  .collection('tematico')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Text("loading....");
                }
                int length = snapshot.data.documents.length;

                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: length,
                  itemBuilder: (_, int index) {
                    //Portada port = portada[index];
                    final DocumentSnapshot doc = snapshot.data.documents[index];
                    return InkWell(
                      onTap: () {
                        print(doc.documentID);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SecondPage(
                                      id: doc.documentID,
                                      title: doc.data['title'],
                                      subtitle: doc.data['subtitle'],
                                      description: doc.data['description'],
                                      img: doc.data['img'],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          //horizontal: 10.0,
                          vertical: 10.0,
                        ),
                        width: imageWidth,
                        height: imageHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: CachedNetworkImage(
                              imageUrl: "${doc.data["img"]}",
                              fit: BoxFit.fill,
                            )),
                      ),
                    );
                  },
                );
              },
            ))
      ],
    );
  }
}
