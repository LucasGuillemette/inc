import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2a_inc/Widget/AppBarCustom.dart';

class ScaffoldCustom extends StatelessWidget {
  final Widget body;
  final AppBarCustom appBarCustom;

  const ScaffoldCustom({Key key, this.body, this.appBarCustom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBarCustom,
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
