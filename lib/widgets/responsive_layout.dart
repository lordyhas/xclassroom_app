
import 'package:flutter/cupertino.dart';

enum ScreenMode {phone, tablet, tv, adapted}
enum ResponsiveAction {none, split, scale}
class ResponsiveLayout extends StatelessWidget {

  final ResponsiveAction responsiveAction;

  const ResponsiveLayout({
    this.responsiveAction = ResponsiveAction.split,
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
