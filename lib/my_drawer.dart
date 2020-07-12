import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_flutter/blocs/colorBloc.dart';
import 'package:test_app_flutter/config/constants.dart' as Constants;

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorBloc>(
        builder: (BuildContext context, ColorBloc value, Widget child) {
      return Drawer(
        child: Container(
          color: Colors.blueGrey,
          child: ListView(
            children: [
              DrawerHeader(
                child: ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text(
                    Constants.drawerHeaderTitle,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.gamepad),
                title: Text("RANDOM",
                  style: TextStyle(color: Colors.white),),
                onTap: () {
                  value.nextColor();
                },
              ),
              ...Constants.colorsMap.entries
                  .map(
                    (el) => ListTile(
                      onTap: () {
                        value.changeColor.add(el.value);
                      },
                      leading: Icon(
                        Icons.arrow_forward,
                        color: el.value,
                        size: 30.0,
                      ),
                      title: Text(el.key,
                        style: TextStyle(color: Colors.white),),
                    ),
                  )
                  .toList()
            ],
          ),
        ),
      );
    });
  }
}
