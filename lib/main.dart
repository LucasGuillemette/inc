import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project2a_inc/Objects/Orchestre.dart';
import 'package:project2a_inc/Pages/Son.dart';
import 'Pages/ConnectionPage.dart';
import 'Pages/CreateConnectionPage.dart';
import 'Pages/JoinConnectionPage.dart';
import 'Pages/MainPage.dart';
//import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  Orchestre orchClient = Orchestre.empty();

  void _setOrchestre(Orchestre orch) {
    setState(() {
      orchClient = orch;
    });
    print(orchClient.getNom);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF0c122f),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(
                  fontSize: 20,
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff0c122f)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.fromLTRB(18, 15, 18, 15)),
            ),
          )),
      title: 'INC',
      home: Son(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(
                child: ConnectionPage(), type: PageTransitionType.fade);
            break;
          case '/mainPage':
            return PageTransition(
                child: MainPage(
                  orch: this.orchClient,
                ),
                type: PageTransitionType.fade);
            break;
          /*case '/settingsPage':
            return PageTransition(
                child: SettingsPage(), type: PageTransitionType.fade);
            break;*/
          case '/connectionPage/rejoindre':
            return PageTransition(
                child: JoinConnectionPage(
                  modifyOrch: _setOrchestre,
                ),
                type: PageTransitionType.fade);
            break;
          case '/connectionPage/creer':
            return PageTransition(
                child: CreateConnectionPage(
                  modifyOrch: _setOrchestre,
                ),
                type: PageTransitionType.fade);
            break;
          case '/Son':
            return PageTransition(child: Son(), type: PageTransitionType.fade);
            break;
          case '/connectionPage/':
            return PageTransition(
                child: ConnectionPage(), type: PageTransitionType.fade);
            break;
          default:
            return null;
        }
      },
    );
  }
}
