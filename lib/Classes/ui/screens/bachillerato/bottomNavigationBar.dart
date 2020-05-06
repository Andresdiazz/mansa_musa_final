import 'package:flutter/material.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:mansamusaapp/Classes/ui/screens/chat/chat_page.dart';
import '../selection_page.dart';
import 'home_page.dart';

class NavigationBarBachiller extends StatefulWidget {
  @override
  _NavigationBarBachillerState createState() => _NavigationBarBachillerState();
}

class _NavigationBarBachillerState extends State<NavigationBarBachiller> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    HomePage(),
    Text('Index 1: Search'),
    Chat(),
    SelectionPage(
      colorAppBar: Color(0xff002E62),
      colorBackground: Color(0xff002E62),
      logo: AssetImage("images/logos/logo3.png"),
      color: Colors.white,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: GradientBottomNavigationBar(
        backgroundColorStart: Theme.of(context).primaryColor,
        backgroundColorEnd: Theme.of(context).primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,

                size: 25,
              ),
              title: Text(
                'Inicio',

              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,  size: 25),
              title: Text(
                'Buscar',

              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat, size: 25),
              title: Text(
                'Chat',

              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.child_care, size: 25),
              title: Text(
                "Prince's",

              )),
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
          title: Center(
              child: Image.asset(
            "images/logos/logo3.png",
            height: 120,
            width: 145,
          )),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: ChatPage(),
        ));
  }
}
