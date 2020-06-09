import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusaapp/Users/bloc/bloc_user.dart';

import 'Classes/ui/screens/selection_page.dart';
import 'Users/ui/screens/login_form.dart';
import 'Users/ui/screens/login_screen.dart';



class OnboardingPage extends StatefulWidget {



  @override
  State<StatefulWidget> createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {

  UserBloc userBloc;

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActivate) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActivate ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActivate ? Colors.white : Colors.white30,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();

  }
    Widget _handleCurrentSession(){
      return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Onboard();
          }else{
            return SelectionPage(
              colorAppBar: Color(0xff002E62),
              colorBackground: Color(0xff002E62),
              logo: AssetImage("images/logos/logo-blanco.png"),
              color: Colors.white,
            );
          }
        },
      );
    }

    Widget Onboard() {

      var media = MediaQuery
          .of( context )
          .size;

    return Scaffold(
      body: ColorfulSafeArea(
        color: Colors.transparent,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            height: media.height * 2,
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor
                ], radius: 1.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: FlatButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: Text(
                          "Siguiente",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Condiciones",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text("Ayuda",
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Container(
                      height: media.height * 0.7,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: [
                          Center(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image(
                                      image: AssetImage(
                                          "images/logos/logo-blanco.png"),
                                      width: 400.0,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Center(child: Image.asset("images/1.png", fit: BoxFit.fill,)),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: media.height / 3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            "Tu eliges como aprender",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28.0),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 50),
                                  child: Center(child: Image.asset("images/2.png", fit: BoxFit.cover,)),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: media.height / 4.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        /*Center(
                                          child: Image(
                                            image:
                                            AssetImage("images/2.png"),
                                            width: 250.0,
                                          ),
                                        ),*/
                                        Container(
                                          width: media.width / 1.4,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.check_box,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Cancela cuando quieras",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 22.0),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                                Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.check_box,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "Aprende desde cualquier\ndispositivo",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 22.0,
                                                        ),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.check_box,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Contenido HD y 4K",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 22.0),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration:
                              Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },

                      ),
                    ))
                    : Text(''),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: RaisedButton(onPressed: ()  =>
                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                  , child: Text('Iniciar Sesión', style: TextStyle(fontSize: 18),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),),
                )


              ],
            ),
          ),
        ),
      ),
      bottomSheet: null,

    );
  }
}
