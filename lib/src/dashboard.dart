library dashboard;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:unhorizons/logic/values.dart';
import 'package:unhorizons/src/admission_page.dart';
import 'package:unhorizons/src/home_page.dart';
import 'package:unhorizons/src/setting_page.dart';
import 'package:unhorizons/widgets/course_list_tile.dart';

part 'dashboard_part/side_drawer.dart';
part 'dashboard_part/side_profile.dart';

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
      ifTrue:  HomePhoneUI(child: child),
      ifFalse: HomeWebUI(child: child),
    );
  }
}

class HomeWebUI extends StatefulWidget {
  const HomeWebUI({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  State<HomeWebUI> createState() => _HomeWebUIState();
}

class _HomeWebUIState extends State<HomeWebUI> {
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
            if (Responsive.of(context).isMaxSize &&
                BlocProvider.of<NavigationController>(context).isProfileNotOpen)
              const SideUserInfoScreen(),
          ],
        ),
      ),
    );
  }

}


class HomePhoneUI extends StatefulWidget {
  const HomePhoneUI({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  State<HomePhoneUI> createState() => _HomePhoneUIState();
}

class _HomePhoneUIState extends State<HomePhoneUI> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      drawer: Drawer(
        child: Column(
          children:  [
            DrawerHeader(child: SizedBox.square(
              dimension: 200,
              child: Image.asset("assets/vectors/vector_cap2a.png"),),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: DrawerContent(),
              ),
            ),
            const Divider(),
            const DrawerFooter(showProfileItem: true,),
          ],
        ),
      ),
      body: Builder(
          builder: (context) {
            return Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).padding.top,),

                ///------ -----
                Flexible(
                  child: SizedBox(child: widget.child,),
                ),

              ],
            );
          }
      ),
    );
  }


}



