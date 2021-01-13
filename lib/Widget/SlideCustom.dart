import 'package:flutter/material.dart';

class SlideCustom extends StatefulWidget {
  @override
  _SlideCustom createState() => _SlideCustom();
}

class _SlideCustom extends State<SlideCustom> {


  double valueSlide = 0;

  @override
  Widget build(BuildContext context) {
    return new Slider(value: valueSlide, min: 0, max: 3, inactiveColor: Colors.grey[500], activeColor: Colors.deepPurple, onChanged: (double d) {
      setState(() {
        valueSlide = d;
      });
    });
  }
}
