library values;
export 'package:unhorizons/logic/models/course_category.dart';

import 'dart:ui';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unhorizons/logic/values/dimens.dart';


export 'package:unhorizons/logic/controller/bloc_controller.dart';
export 'values/colors_theme.dart';
export 'values/dimens.dart';
export 'package:utils_component/utils_component.dart';



class Responsive {
  final BuildContext context;
  const Responsive._(this.context);
  static Responsive of(BuildContext context) => Responsive._(context);

  Size get size => MediaQuery.of(context).size;
  bool get isPhone => size.width <= kPhoneDimens || !kIsWeb;
  bool get isWeb => size.width > kPhoneDimens || kIsWeb;
  bool get isWebPlatform => kIsWeb;
  bool get isDesktop => size.width > kPhoneDimens;
}


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


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context,
      Widget child,
      AxisDirection axisDirection,) {
    return child;
  }
}

