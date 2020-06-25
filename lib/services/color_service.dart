import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app_flutter/configs/constants.dart' as Constants;

class ColorService {
  var random = new Random();

  Color generateColor() {
    return Color.fromRGBO(random.nextInt(255), random.nextInt(255),
        random.nextInt(255), Constants.colorOpacity);
  }

  Color changeOpacity(Color color, double d) {
    var newOpacity = color.opacity + d;
    if (newOpacity > 1)
      newOpacity = 1;
    else if (newOpacity < 0) newOpacity = 0;
    return color.withOpacity(newOpacity);
  }

  Color changeAlpha(Color color, int d) {
    var newAlpha = color.alpha + d;
    if (newAlpha > 255)
      newAlpha = 255;
    else if (newAlpha < 0) newAlpha = 0;
    return color.withAlpha(newAlpha);
  }

  Color updColor(Color color, double dx, double dy) {
    if (dx != 0) color = changeAlpha(color, dx.round());
    if (dy != 0) color = changeOpacity(color, -dy * Constants.changeOpacitySensitivity);
    return color;
  }
}
