import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import '../../../../mansa_icon_icons.dart';
import '../selection_page.dart';
import 'ChatPage.dart';
import 'components/Banner.dart';
import 'components/content_scroll.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'components/content_scrollJugando.dart';
import 'components/content_scrollTemas.dart';
import 'searchBachillerato.dart';

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
        title: Image.asset(
          "images/logos/logo-blanco.png",
          height: 70,
        ),
        actions: [
          IconButton(
              icon: Icon(MansaIcon.search),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchBachillerato()));
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Theme.of(context).primaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                icon: Icon(MansaIcon.chat),
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Chat()));
                },
                color: Colors.white,
                iconSize: 30,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.amber[200], Colors.orange[900]],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                icon: Icon(MansaIcon.perfil),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SelectionPage()));
                },
                color: Colors.white,
                iconSize: 30,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fondo.png"), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            BannerPage(
              imageHeight: 190,
              imageWidth: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 10.0),
            ContentScrollEje(
              title: 'Eje Temático',
              imageHeight: 140.0,
              imageWidth: 183.0,
              padding: 15,
              paddingContainer: 0,
            ),
            SizedBox(height: 10.0),
            ContentScrollTema(
              title: 'Temas de Interés',
              imageHeight: 140.0,
              imageWidth: 183.0,
              padding: 15,
              paddingContainer: 0,
            ),
            SizedBox(height: 10.0),
            ContentScrolJugando(
              title: 'Aprende Jugando',
              imageHeight: 140.0,
              imageWidth: 183.0,
              padding: 15,
              paddingContainer: 0,
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
    return StreamBuilder(
      stream: Firestore.instance.collection('bachillerato').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text("loading....");
        }
        int length = snapshot.data.documents.length;
        List<NetworkImage> list = new List<NetworkImage>();
        return ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (_, int index) {
            final DocumentSnapshot doc = snapshot.data.documents[index];
            for (var i = 1; i <= doc.data.length; i++) {
              list.add(NetworkImage(doc.data["img_" + i.toString()]));
            }
            return InkWell(
              onTap: () {
                print(doc.data.length);
              },
              child: Stack(
                children: [
                  SizedBox(
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
                        images: list),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.orange[400],
                              Colors.orange[900]
                            ]),
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0.0, 7.0),
                                blurRadius: 6.0,
                              ),
                            ]),
                        child: Center(
                          child: Text(
                            "INGRESA",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
