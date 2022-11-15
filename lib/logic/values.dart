library values;
export 'package:unhorizons/logic/models/course_category.dart';
export 'package:unhorizons/logic/controller/bloc_controller.dart';
export 'values/colors_theme.dart';
import 'dart:ui';


class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

