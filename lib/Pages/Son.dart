import 'package:flutter/material.dart';
//import 'package:project2a_inc/Pages/__nomRandomTest.dart';
import 'package:project2a_inc/Widget/AppBarCustom.dart';
import 'package:project2a_inc/Widget/DropDownButtonCustom.dart';
import 'package:project2a_inc/Widget/ScaffoldCustom.dart';
import 'package:project2a_inc/Widget/SlideCustom.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Son extends StatefulWidget {
  @override
  _SoundState createState() => _SoundState();
}

class _SoundState extends State<Son> {
  bool playing = false; //Au début on ne joue pas de piste
  IconData playBtn =
      Icons.play_arrow; //état principal de l'icône du bouton de lecture

  //Création lecture de musique
  //On déclare un objet

  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLenght = new Duration();
  int piste = 1;

//fonction de recherche qui nous permettra d'aller à une certaine position de la musique
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  //Initialisons le lecteur
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //temps du lecteur

    // fonction durée musique
    // ignore: deprecated_member_use
    _player.durationHandler = (d) {
      setState(() {
        musicLenght = d;
      });
    };

    //fonction déplacer le curseur du curseur pendant que nous jouons le morceau
    // ignore: deprecated_member_use
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  int getPiste() {
    return piste;
  }

  void setPiste(int piste) {
    this.piste = piste;
  }

  //fonction pour mettre une piste en boucle
  void boucle(int num) {
    cache.loop("InC_" + num.toString() + ".mp3");
  }

  //fonction pour passer à la piste suivante
  void nextSong() {
    if (getPiste() + 1 <= 53) {
      setPiste(getPiste() + 1);
      boucle(getPiste());
    }
  }

  //fonction pour revenir à la piste précédente
  void previousSong() {
    if (getPiste() - 1 > 0) {
      setPiste(getPiste() - 1);
      boucle(getPiste());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: AppBarCustom(
        context: context,
        title: "Pistes",
        haveReturnButton: false,
        otherWidgetList: [
          new IconButton(
            icon: new Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/connectionPage/');
            },
            color: Colors.white,
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(bottom: 40.0),
            child: DropDownButtonCustom(),
          ),
          new Container(
            color: Colors.red,
            child: new Image.asset('assets/in-C.png'),
          ),
          new Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Text(
              'Piste N°' + getPiste().toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          new Container(
              margin: EdgeInsets.only(top: 5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.fast_rewind),
                    onPressed: () {
                      previousSong();
                    },
                    iconSize: 50,
                  ),
                  IconButton(
                    iconSize: 62.0,
                    color: Colors.black,
                    onPressed: () {
                      if (!playing) {
                        //Faire jouer le son
                        //cache.play("InC_1.mp3");
                        boucle(getPiste());
                        setState(() {
                          playBtn = Icons.pause;
                          playing = true;
                        });
                      } else {
                        _player.pause();
                        setState(() {
                          playBtn = Icons.play_arrow;
                          playing = false;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.play_arrow,
                    ),
                  ),
                  new IconButton(
                      icon: new Icon(Icons.fast_forward),
                      onPressed: () {
                        nextSong();
                      },
                      iconSize: 50),
                ],
              )),
          new Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[new Text("0.0"), new Text("3.0")],
              )),
          new Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0),
              child: new SlideCustom())
        ],
      )),
    );
  }
}
