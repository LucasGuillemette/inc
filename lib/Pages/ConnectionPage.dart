import 'package:flutter/material.dart';
import 'package:project2a_inc/Widget/AppBarCustom.dart';
import 'package:project2a_inc/Widget/ScaffoldCustom.dart';

class ConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Null> alerte() async {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: Text("Qu'est ce que 'In C' ?"),
              content: (Text(
                  "In C est une application musicale qui permet de se rassembler autour de la musique. "
                  "Elle permet de facilité l'integration des étrangers dans le processus de création... ")),
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
        title: "Connection",
        haveReturnButton: false,
        otherWidgetList: [
          new IconButton(
            icon: new Icon(Icons.perm_device_information),
            onPressed: () {
              alerte();
            },
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                width: 500.0,
                height: 150.0,
                child: new Image.asset('assets/Note.png'),
              ),
              Container(
                  width: 250.0,
                  height: 60.0,
                  margin: EdgeInsets.only(),
                  child: ElevatedButton(
                    onPressed: () {
                      print("rejoindre orchestre");
                      Navigator.pushNamed(context, '/connectionPage/rejoindre');
                    },
                    child: Text(
                      "Rejoindre un Orchestre",
                    ),
                  )),
              Container(
                  width: 250.0,
                  height: 60.0,
                  margin: EdgeInsets.only(bottom: 155.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print("creer orchestre");
                      Navigator.pushNamed(context, '/connectionPage/creer');
                    },
                    child: Text(
                      "Creer un Orchestre",
                    ),
                  )),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );

    /*Scaffold(
      appBar: AppBar(
        title: Text("Connection"),
        actions: [],
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  print("rejoindre orchestre");
                  Navigator.pushNamed(context, '/connectionPage/rejoindre');
                },
                child: Text(
                  "Rejoindre un Orchestre",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("creer orchestre");
                  Navigator.pushNamed(context, '/connectionPage/creer');
                },
                child: Text(
                  "Creer un Orchestre",
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          height: MediaQuery.of(context).size.height * 0.3,
        ),
      ),
    );*/
  }
}
