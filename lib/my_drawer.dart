import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_flutter/blocs/colorBloc.dart';
import 'package:test_app_flutter/config/constants.dart' as Constants;

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Consumer<ColorBloc>(
        builder: (BuildContext context, ColorBloc value, Widget child) {
      return StreamBuilder<Color>(
          stream: value.backgroundColor,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              controller.text = snapshot.data.opacity.toStringAsPrecision(2);
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
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
                      child: TextField(
                        controller: controller,
                        maxLengthEnforced: true,
                        maxLength: 4,
                        decoration: InputDecoration(
                            helperText: "Must be > 0 & < 1",
                            prefixText: "Opacity = "),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.blueGrey[700],
                          child: Text("Submit"),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            value.changeColorOpacity(
                                double.parse(controller.text));
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Icon(Icons.gamepad),
                      title: Text(
                        "RANDOM",
                        style: TextStyle(color: Colors.white),
                      ),
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
                            title: Text(
                              el.key,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            );
          });
    });
  }
}
