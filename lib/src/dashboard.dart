library dashboard;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:unhorizons/logic/values.dart';
import 'package:unhorizons/widgets/course_list_tile.dart';
import 'package:unhorizons/widgets/widgets.dart';

import 'package:unhorizons/res.dart';

part 'dashboard/side_drawer.dart';

part 'dashboard/side_profile.dart';

part 'home/home_screen.dart';

part 'home/menu_home.dart';

part 'user_info_screen.dart';

part 'home_page.dart';

const double maxUserSideAppear = 1500;

class Dashboard extends StatelessWidget {
  static const routeName = "root_page";

  final Widget? child;

  const Dashboard({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("${Responsive.of(context).size} =========================");
    }
    return BooleanBuilder(
      condition: () => Responsive.of(context).isPhone,
      ifTrue:  HomePage(child: child),
      ifFalse:  DashboardWeb(child: child),
    );
  }
}

class DashboardWeb extends StatefulWidget {
  const DashboardWeb({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  State<DashboardWeb> createState() => _DashboardWebState();
}

class _DashboardWebState extends State<DashboardWeb> {
  void openDrawer() {
    if (Scaffold.of(context).isDrawerOpen) {
      Scaffold.of(context).closeDrawer();
    } else {
      Scaffold.of(context).openDrawer();
    }
  }

  void setOff(){
    GoRouter.of(context).addListener(() {
      if (kDebugMode) {
        print('_DashboardWebState.setOff');
        print('${GoRouter.of(context).location} =====  ====');
      }
    });
    /*if(GoRouter.of(context).location == UserInfoScreen.routeName){

    }*/
  }

  @override
  Widget build(BuildContext context) {


    final double screenWidth = MediaQuery.of(context).size.width;
    //debugPrint("screen w : $screenWidth");
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            ///------------------ SIDE DRAWER ------------------------
            const SideDrawer(),

            /// ----------------- HOME SCREEN ------------------------
            Flexible(
              child: SizedBox(
                child: widget.child,
              ),
            ),

            /// ----------------- SIDE PROFILE -----------------------
            if (screenWidth > maxUserSideAppear ||  BlocProvider.of<NavigationController>(context).isProfileNotOpen)
              const SideUserInfoScreen(),
          ],
        ),
      ),
    );
  }

  Widget _getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
