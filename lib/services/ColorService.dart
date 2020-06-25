import 'dart:math';
import 'package:test_app_flutter/configs/constants.dart' as Constants;

import 'package:flutter/material.dart';

class ColorService {
  static Random random = new Random();

  Color generateColor() {
    return Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), Constants.colorOpacity);
  }

  Color changeOpacity(Color color, double dy) {
    var newOpacity = color.opacity - dy / 300;
    if (newOpacity > 1) newOpacity = 1;
    if (newOpacity < 0) newOpacity = 0;
    return color.withOpacity(newOpacity);
  }

  Color changeAlpha(Color color, double dx) {
    var newAlpha = color.alpha - dx.round();
    if (newAlpha > 255) newAlpha = 255;
    if (newAlpha < 0) newAlpha = 0;
    return color.withAlpha(newAlpha);
  }
}
