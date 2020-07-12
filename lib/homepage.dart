import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_flutter/config/constants.dart' as Constants;
import 'package:test_app_flutter/my_drawer.dart';

import 'blocs/colorBloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ColorBloc>(context);
    return StreamBuilder(
      stream: bloc.backgroundColor,
      builder: (context, snapshot) {
        return GestureDetector(
            onTap: () => bloc.nextColor(),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  Constants.title,
                  textAlign: TextAlign.center,
                ),
              ),
              drawer: MyDrawer(),
              backgroundColor: snapshot.data,
              body: Center(
                  child: Text(
                Constants.mainText,
                style: TextStyle(fontSize: Constants.textSize),
              )),
            ));
      }
    );
  }

}
