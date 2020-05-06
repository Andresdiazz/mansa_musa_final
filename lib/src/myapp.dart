import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mansamusaapp/Classes/ui/screens/bachillerato/bottomNavigationBar.dart';
import 'package:mansamusaapp/Classes/ui/screens/bachillerato/thirdPage.dart';
import 'package:mansamusaapp/Classes/ui/screens/preescolar/navigationBarPreescolar.dart';
import 'package:mansamusaapp/Classes/ui/screens/primaria/navigationBarPrimaria.dart';
import 'package:mansamusaapp/Classes/ui/screens/selection_page.dart';
import 'package:mansamusaapp/Users/bloc/bloc_user.dart';
import 'package:mansamusaapp/Users/ui/screens/login_form.dart';
import 'package:mansamusaapp/onboarding.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: "Giil Sans MT",
            brightness: Brightness.light,
            primaryColor: Color(0xff002E62),
            accentColor: Color(0xff000914)),
        title: "Mansa Musa App",
        home: OnboardingPage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new SelectionPage(
            colorAppBar: Color(0xff002E62),
            colorBackground: Color(0xff002E62),
            logo: AssetImage("images/logos/logo3.png"),
            color: Colors.white,
          ),
          '/secondPage': (BuildContext context) => ThirdPage(),
          '/HomePagePreescolar' : (BuildContext context) => new NavigationBarPreescolar(),
          '/HomePagePrimaria' : (BuildContext context) => new NavigationBarPrimaria(),
          '/HomePageBachillerato' : (BuildContext context) => new NavigationBarBachiller(),

        },
      ),
      bloc: UserBloc(),
    );
  }
}
