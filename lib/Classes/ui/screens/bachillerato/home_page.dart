import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'components/content_scroll.dart';
import 'components/content_scrollTemas.dart';
import 'model/clases_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
            AssetImage("images/EJE TEMATICO/1.jpg"),
            AssetImage("images/TEMAS INTERES/1.jpg"),
            AssetImage("images/EJE TEMATICO/2.jpg"),
            AssetImage("images/TEMAS INTERES/2.jpg"),
          ],
        ),
      ),
    );

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Image.asset("images/logos/logo3.png", height: 120, width: 145,),
        ),
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
            portadas,
            SizedBox(height: 20.0),
            ContentScrollEje(
              images: ejeTematicoList,
              title: 'Eje Temático',
              imageHeight: 120.0,
              imageWidth: 123.0,
              padding: 15,
              paddingContainer: 6,
            ),
            SizedBox(height: 10.0),
            ContentScrollTema(
              images: temasInteresList,
              title: 'Temas de Interés',
              imageHeight: 250.0,
              imageWidth: 123.0,
              padding: 15,
              paddingContainer: 6,
            ),
            SizedBox(height: 10.0),
            ContentScrollEje(
              images: ejeTematicoList,
              title: 'Aprende Jugando',
              imageHeight: 120.0,
              imageWidth: 123.0,
              padding: 15,
              paddingContainer: 6,
            ),

            //CardImage2()
          ],
        ),
      ),
    );
  }
}