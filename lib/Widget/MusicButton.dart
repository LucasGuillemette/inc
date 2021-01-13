import 'package:flutter/material.dart';

class MusicButton extends StatefulWidget {
  @override
  _MusicButton createState() => _MusicButton();
}

class _MusicButton extends State<MusicButton> {
  int _counter = 0;
  String _textButton = "Lancer la premier piste";
  String _testPiste = "---------";

  void _increment() {
    if (_counter < 51) {
      setState(() {
        _counter++;
        _textButton = "Piste suivante";
        _testPiste = "Piste n°$_counter";
      });
    } else if (_counter == 51) {
      setState(() {
        _counter++;
        _textButton = "Dernière piste";
        _testPiste = "Piste n°$_counter";
      });
    } else if (_counter == 52) {
      setState(() {
        _counter++;
        _textButton = "Revenir à la première piste";
        _testPiste = "Piste n°$_counter";
      });
    } else {
      setState(() {
        _counter = 1;
        _textButton = "Piste suivante";
        _testPiste = "Piste n°$_counter";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            _testPiste,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _increment();
            },
            child: Text(
              _textButton,
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      height: 120,
    );
  }
}
