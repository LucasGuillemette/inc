import 'package:flutter/material.dart';
import 'package:project2a_inc/Widget/AppBarCustom.dart';
import 'package:project2a_inc/Widget/ScaffoldCustom.dart';
import 'package:project2a_inc/Widget/TextForm.dart';

class JoinConnectionPage extends StatelessWidget {
  final Function modifyOrch;

  JoinConnectionPage({this.modifyOrch});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: AppBarCustom(
        context: context,
        title: "Rejoindre Orchestre",
        haveReturnButton: true,
        otherWidgetList: [],
      ),
      body: Center(
        child: TextForm(
          titre: 'Entrez le code',
          type: 'join',
          modifyOrch: modifyOrch,
          typeTextCapitalization: TextCapitalization.characters,
          context: context,
        ),
      ),
    );
  }
}
