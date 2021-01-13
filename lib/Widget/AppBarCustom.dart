import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  final bool haveReturnButton;
  final String title;
  final BuildContext context;
  final List<Widget> otherWidgetList;


  AppBarCustom({
    Key key,
    this.context,
    this.title,
    this.haveReturnButton,
    this.otherWidgetList,
  }) : super(key: key);

  TextStyle getTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 25);
  }

  Widget getBackButton() {
    if (this.haveReturnButton) {
      return IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Revenir en arriere',
      );
    }

    return Container();
  }

  EdgeInsets getPadding() {
    if (haveReturnButton) {
      return EdgeInsets.fromLTRB(0, 21, 10, 0);
    } else {
      return EdgeInsets.fromLTRB(15, 21, 15, 0);
    }
  }

  Row getOthersWidget() {
    return Row(
      children: otherWidgetList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          getBackButton(),
          Text(
            title,
            style: getTextStyle(),
          ),
          Expanded(child: Container()),
          getOthersWidget()
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.14,
      color: Theme.of(context).primaryColor,
      padding: getPadding(),
    );
  }

}
