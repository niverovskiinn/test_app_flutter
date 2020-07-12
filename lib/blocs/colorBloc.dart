import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_app_flutter/config/constants.dart' as Constants;

class ColorBloc {
  Color _color;

  ColorBloc() {
    _color = _generateColor();
    _controller.stream.listen(_changeStream);
    _changeColor.add(_color);
  }

  final _colorStream = BehaviorSubject<Color>.seeded(_generateColor());

  Stream<Color> get backgroundColor => _colorStream.stream;

  Sink get _changeColor => _colorStream.sink;

  StreamController _controller = StreamController();

  StreamSink get changeColor => _controller.sink;

  void dispose() {
    _controller.close();
    _colorStream.close();
  }

  void _changeStream(data) {
    if (data == null)
      _color = Colors.transparent;
    else {
      _color = data;
    }
    _changeColor.add(_color);
  }

  static Color _generateColor() {
    var _random = new Random();

    return Color.fromRGBO(_random.nextInt(255), _random.nextInt(255),
        _random.nextInt(255), Constants.colorOpacity);
  }

  void nextColor() => _changeColor.add(_generateColor());

  void changeColorOpacity(double opacity) =>
      _changeColor.add(_color.withOpacity(opacity));
}
