import 'package:flutter/material.dart';
import 'package:project2a_inc/Objects/Orchestre.dart';
import 'package:project2a_inc/Widget/AppBarCustom.dart';
import 'package:project2a_inc/Widget/ScaffoldCustom.dart';
import '../Widget/MusicButton.dart';

class MainPage extends StatelessWidget {
  final Orchestre orch;

  MainPage({this.orch});

  @override
  Widget build(BuildContext context) {
    Future<Null> alerte() async {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: Text("Qu'est ce que In C ?"),
              content: Text("In C est une appli musicale ... "),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Compris'))
              ],
            );
          });
    }

    return ScaffoldCustom(
      appBarCustom: AppBarCustom(
        context: context,
        title: "In C",
        haveReturnButton: false,
        otherWidgetList: [
          IconButton(
              icon: Icon(
                Icons.queue_music,
                color: Colors.white,
              ),
              onPressed: null),
          IconButton(
            icon: Icon(
              Icons.perm_device_information,
              color: Colors.white,
            ),
            onPressed: () {
              alerte();
            },
          ),
          IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                //Ajouter deconnection à l'orchestre.
              }),
        ],
      ),
      /*Scaffold(
      appBar: AppBar(
        title: Text(
          'INC',
        ),
        actions: <Widget>[
          Row(
            children: [
              Container(
                child: Text(
                  'In C',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          IconButton(
            icon: Icon(Icons.connect_without_contact_sharp),
            tooltip: 'Lancer le connection !',
            onPressed: () {
              Navigator.pushNamed(context, '/connectionPage');
            },
          ),
          IconButton(
            icon: Icon(Icons.library_music),
            tooltip: 'Lancer le connection !',
            onPressed: () {
              Navigator.pushNamed(context, '/settingsPage');
            },
          ),
        ],
      ),*/
      body: BodyMainPage(orch: orch),
    );
  }
}

class BodyMainPage extends StatelessWidget {
  final Orchestre orch;

  BodyMainPage({this.orch});

  String afficheCode() {
    if (orch.getCode == null) {
      return "Deconnecté";
    } else {
      return orch.getCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/Music.png",
              height: 100,
            ),
            //Expanded(child: SizedBox()),
            MusicButton(),
            Text(afficheCode()),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        height: 270,
      ),
    );
  }
}
