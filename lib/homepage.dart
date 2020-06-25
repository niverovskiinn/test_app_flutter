import 'package:flutter/material.dart';
import 'package:test_app_flutter/configs/constants.dart' as Constants;
import 'package:test_app_flutter/services/ColorService.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color backgroundColor;
  final ColorService colorService = ColorService();

  @override
  void initState() {
    super.initState();
    this.backgroundColor = colorService.generateColor();
  }

  void changeColor() {
    setState(() {
      this.backgroundColor = colorService.generateColor();
    });
  }

  void updColor(DragUpdateDetails e) {
    setState(() {
      if (e.delta.dx != 0)
        this.backgroundColor =
            colorService.changeAlpha(backgroundColor, e.delta.dx);
      if (e.delta.dy != 0)
        this.backgroundColor =
            colorService.changeOpacity(backgroundColor, e.delta.dy);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: changeColor,
        onPanUpdate: updColor,
        child: Scaffold(
          backgroundColor: this.backgroundColor,
          body: Center(
              child: Text(
            Constants.mainText,
            style: TextStyle(fontSize: Constants.textSize),
          )),
        ));
  }
}
