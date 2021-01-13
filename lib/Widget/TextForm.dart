import 'package:flutter/material.dart';
import 'package:project2a_inc/Objects/Orchestre.dart';

class TextForm extends StatelessWidget {
  final String titre;
  final String type;
  final Function modifyOrch;
  final TextCapitalization typeTextCapitalization;
  final BuildContext context;

  const TextForm(
      {this.titre,
      this.type,
      this.modifyOrch,
      this.typeTextCapitalization,
      this.context});

  void _enterText(String text) {
    if (this.type == 'join') {
      // /!\Example pour test mais a modifier avec la connection/!\

      //Recuperation Orchestre à partir de connection
      text = text.toUpperCase();
      Orchestre joinOrch = Orchestre.fromCode(text);

      //appel à la fonction _setOrchestre de MyApp
      this.modifyOrch(joinOrch);
    } else if (this.type == 'create') {
      //Creation d'un Orchestre à partir d'un nom
      Orchestre createOrch = Orchestre.create(text);

      //appel à la fonction _setOrchestre de MyApp
      this.modifyOrch(createOrch);
    } else {
      //erreur mauvais argument type
      print("Erreur TextFormValidation : mauvais argument type");
    }

    //ALler à la home page
    Navigator.pushNamed(context, '/mainPage');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 4,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: TextField(
        decoration: InputDecoration.collapsed(
          hintText: this.titre,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintStyle: TextStyle(fontSize: 25),
        ),
        style: TextStyle(fontSize: 25),
        onSubmitted: (text) {
          _enterText(text);
        },
        cursorColor: Theme.of(context).primaryColor,
        textCapitalization: typeTextCapitalization,
        textAlign: TextAlign.center,
      ),
      width: MediaQuery.of(context).size.height * 0.4,
    );
  }
}
