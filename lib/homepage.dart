import 'package:flutter/material.dart';
import 'package:test_app_flutter/configs/constants.dart' as Constants;
import 'package:test_app_flutter/services/color_service.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color backgroundColor;
  final colorService = ColorService();

  @override
  void initState() {
    super.initState();
    this.backgroundColor = colorService.generateColor();
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

  void changeColor() {
    setState(() {
      this.backgroundColor = colorService.generateColor();
    });
  }

  void updColor(DragUpdateDetails e) {
    setState(() {
      this.backgroundColor =
          colorService.updColor(backgroundColor, e.delta.dx, e.delta.dy);
    });
  }
}
