import 'package:flutter/material.dart';
import 'package:test_app_flutter/homepage.dart';

/*

TODO
  1. Install Flutter
  2. Create a test application
  3. The application should: display the text "Hey there" in the middle of the
    screen and after tapping anywhere on the screen a background color should be
    changed to a random color. You can also add any other feature to the app -
    that adds bonus points
  4. Please do not use any external libraries for color generation
  5. Push code to a GitHub
  6. Send the link to a GitHub repository back

 */

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
