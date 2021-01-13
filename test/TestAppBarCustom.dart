import 'package:flutter/material.dart';
import 'package:project2a_inc/Widget/AppBarCustom.dart';
import 'package:project2a_inc/Widget/ScaffoldCustom.dart';

void main() {
  runApp(MyTestApp());
}

class MyTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0c122f),
        backgroundColor: Colors.white,
      ),
      home: ScaffoldCustom(
        appBarCustom: AppBarCustom(
          title: "In C",
          context: context,
          haveReturnButton: true,
          otherWidgetList: [
            IconButton(
                icon: Icon(
                  Icons.queue_music,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                onPressed: null),
            //queue_music

            //info

            //reply_rounded
            //link_off_rounded
            //highlight_remove_rounded
            //cancel
          ],
        ),
        body: Center(
          child: Text('bonjour'),
        ),
      ),
    );
  }
}
