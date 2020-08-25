import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../Classes/ui/screens/bachillerato/home_page.dart';
import '../Classes/ui/screens/bachillerato/thirdPage.dart';
import '../Classes/ui/screens/preescolar/home_page.dart';
import '../Classes/ui/screens/primaria/home_page.dart';
import '../Classes/ui/screens/selection_page.dart';
import '../Users/bloc/bloc_user.dart';
import '../onboarding.dart';

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
          '/home': (BuildContext context) => new SelectionPage(),
          '/secondPage': (BuildContext context) => ThirdPage(),
          '/HomePagePreescolar': (BuildContext context) =>
              new HomePagePreescolar(),
          '/HomePagePrimaria': (BuildContext context) => new HomePagePrimaria(),
          '/HomePageBachillerato': (BuildContext context) => new HomePage(),
        },
      ),
      bloc: UserBloc(),
    );
  }
}
