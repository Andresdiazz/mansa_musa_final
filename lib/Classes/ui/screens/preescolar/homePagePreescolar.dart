import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'content_scroll_preescolar.dart';
import 'model/clases_model_preescolar.dart';

class HomePagePreescolar extends StatefulWidget {
  @override
  _HomePagePreescolarState createState() => _HomePagePreescolarState();
}

class _HomePagePreescolarState extends State<HomePagePreescolar> {

  final portadas =
  InkWell(
    onTap: (){
      print("Portadas");
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
        images: [
          NetworkImage('https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1040&q=80'),
          NetworkImage('https://images.unsplash.com/photo-1478720568477-152d9b164e26?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
          NetworkImage('https://images.unsplash.com/photo-1542204625-ca960ca44635?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
          NetworkImage('https://images.unsplash.com/photo-1461151304267-38535e780c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1490&q=80'),
        ],
      ),
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("images/logos/logo2.png", height: 120, width: 145,),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: ListView(
          children: <Widget>[
            portadas,
            SizedBox(height: 20.0),
            ContentScrollEjePreescolar(
              images: ejeTematicoListPreescolar,
              title: 'Eje Temático',
              imageHeight: 120.0,
              imageWidth: 123.0,
            ),
            SizedBox(height: 10.0),
            ContentScrollEjePreescolar(
              images: ejeTematicoListPreescolar,
              title: 'Temas de Interés',
              imageHeight: 250.0,
              imageWidth: 123.0,
            ),
            SizedBox(height: 10.0),
            ContentScrollEjePreescolar(
              images: aprendeJugandoListPreescolar,
              title: 'Aprende Jugando',
              imageHeight: 120.0,
              imageWidth: 123.0,
            ),
            //CardImage2()
          ],
        ),
      ),
    );
  }
}