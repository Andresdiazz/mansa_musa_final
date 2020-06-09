import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:mansamusaapp/Classes/ui/screens/bachillerato/shopPage.dart';
import 'components/content_scroll.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'components/content_scrollJugando.dart';
import 'components/content_scrollTemas.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Image.asset("images/logos/logo-blanco.png", width: 90,),
        ),
        actions: [
          IconButton(icon: Icon(FontAwesomeIcons.solidCreditCard, color: Colors.deepOrangeAccent,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Pago()));
          })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Colors.black
                ],
                radius: 1.0
            )
        ),
        child: ListView(
          children: <Widget>[
            Principal(),          
            SizedBox(height: 10.0),
            ContentScrollEje(
              title: 'Eje Temático',
              imageHeight: 120.0,
              imageWidth: 123.0,
              padding: 15,
              paddingContainer: 6,
            ),
             SizedBox(height: 10.0),
            ContentScrollTema(
              title: 'Temas de Interés',
              imageHeight: 250.0,
              imageWidth: 123.0,
              padding: 15,
              paddingContainer: 6,
            ),
               SizedBox(height: 10.0),
            ContentScrolJugando(
              title: 'Aprende Jugando',
              imageHeight: 120.0,
              imageWidth: 123.0,
              padding: 15,
              paddingContainer: 6,
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
          stream: Firestore.instance.collection('bachillerato').snapshots(),
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
                          boxFit: BoxFit.fill,
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






