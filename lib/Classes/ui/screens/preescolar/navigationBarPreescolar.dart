import 'package:flutter/material.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:mansamusaapp/Classes/ui/screens/chat/chat_page.dart';

import '../selection_page.dart';
import 'homePagePreescolar.dart';

class NavigationBarPreescolar extends StatefulWidget {
  @override
  _NavigationBarPreescolarState createState() => _NavigationBarPreescolarState();
}

class _NavigationBarPreescolarState extends State<NavigationBarPreescolar> {

  int _selectedIndex = 0;
  final _widgetOptions = [
    HomePagePreescolar(),
    Text('Index 1: Search'),
    Chat(),
    SelectionPage(
      logo: AssetImage("images/logos/logo2.png"),
      colorAppBar: Colors.white,
      colorBackground: Colors.white,
      color: Color(0xff002E62),
    )

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: GradientBottomNavigationBar(
        backgroundColorStart: Colors.white,
        backgroundColorEnd: Colors.white,
        fixedColor: Theme.of(context).primaryColor,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Theme.of(context).primaryColor,size: 25), title: Text('Inicio', style: TextStyle(color: Theme.of(context).primaryColor),)),
          BottomNavigationBarItem(icon: Icon(Icons.search, color: Theme.of(context).primaryColor,size: 25), title: Text('Buscar', style: TextStyle(color: Theme.of(context).primaryColor))),
          BottomNavigationBarItem(icon: Icon(Icons.chat, color: Theme.of(context).primaryColor,size: 25), title: Text('Chat', style: TextStyle(color: Theme.of(context).primaryColor))),
          BottomNavigationBarItem(icon: Icon(Icons.child_care, color: Theme.of(context).primaryColor,size: 25), title: Text("Prince's", style: TextStyle(color: Theme.of(context).primaryColor))),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 20,

      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }
}

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: Image.asset(
                "images/logos/logo2.png",
                height: 120,
                width: 145,
              )),
        ),
        body: Container(
          child: ChatPage(),
        ));
  }
}