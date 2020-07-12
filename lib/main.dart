import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_flutter/blocs/colorBloc.dart';
import 'package:test_app_flutter/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ColorBloc>(
            create: (_) => ColorBloc(),
            dispose: (_, ColorBloc colorBloc) => colorBloc.dispose())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
