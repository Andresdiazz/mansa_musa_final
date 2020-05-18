import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'content_scroll_primaria.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'content_scroll_primaria_interes.dart';
import 'content_scroll_primaria_jugando.dart';


class HomePagePrimaria extends StatefulWidget {
  @override
  _HomePagePrimariaState createState() => _HomePagePrimariaState();
}

class _HomePagePrimariaState extends State<HomePagePrimaria> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("images/logos/logo.png", height: 120, width: 145,),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: ListView(
          children: <Widget>[
            Principal(),
            SizedBox(height: 20.0),
            ContentScrollEjePrimaria(
              title: 'Eje Temático',
              imageHeight: 120.0,
              imageWidth: 123.0,
            ),
            SizedBox(height: 10.0),
            ContentScrollIntPrimaria(
              title: 'Temas de Interés',
              imageHeight: 250.0,
              imageWidth: 123.0,
            ),
            SizedBox(height: 10.0),
            ContentScrollJugPrimaria(
              title: 'Aprende Jugando',
              imageHeight: 120.0,
              imageWidth: 123.0,
            ),
          ],
        ),
      ),
    );
  }
}

class Principal extends StatefulWidget {

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
   @override
Widget build(BuildContext context) {
    return  StreamBuilder(
          stream: Firestore.instance.collection('primaria').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (!snapshot.hasData) {  return Text("loading...."); }
                int length = snapshot.data.documents.length;
                List<NetworkImage> list = new List<NetworkImage>();     
          return ListView.builder(
             shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (_, int index ){
                final DocumentSnapshot doc = snapshot.data.documents[index];
                  for (var i = 1; i <= doc.data.length; i++) { 
                  list.add(NetworkImage(doc.data["img_"+i.toString()]));
                      }     
                return InkWell(
                  onTap: (){
                        print(doc.data.length);
                      },
                   child: SizedBox(
                     height: 190,
                     width: double.infinity,
                        child: Carousel(
                          boxFit: BoxFit.cover,
                          autoplay: true,
                          autoplayDuration: Duration(seconds: 5),
                          animationCurve: Curves.fastOutSlowIn,
                          animationDuration: Duration(milliseconds: 1000),
                          dotSize: 4.0,
                          dotSpacing: 15.0,
                          dotColor: Colors.white30,
                          indicatorBgPadding: 5.0,
                          moveIndicatorFromBottom: 180.0,
                          dotIncreasedColor: Colors.white,
                          dotBgColor: Colors.transparent,
                          dotPosition: DotPosition.topRight,
                          showIndicator: true,
                          images: list
                        ),
                   ) ,    
                );
              },
           );
          },
        );  
  }
}






