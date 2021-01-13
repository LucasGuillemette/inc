import 'package:flutter/material.dart';
import 'package:project2a_inc/Widget/AppBarCustom.dart';
import 'package:project2a_inc/Widget/ScaffoldCustom.dart';
import 'package:project2a_inc/Widget/TextForm.dart';

class CreateConnectionPage extends StatelessWidget {
  final Function modifyOrch;

  CreateConnectionPage({this.modifyOrch});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: AppBarCustom(
        context: context,
        title: "Creer un Orchestre",
        haveReturnButton: true,
        otherWidgetList: [],
      ),
      body: Center(
        child: TextForm(
          titre: 'Entrez un Nom',
          type: 'create',
          modifyOrch: modifyOrch,
          typeTextCapitalization: TextCapitalization.words,
          context: context,
        ),
      ),
    );
  }
}
