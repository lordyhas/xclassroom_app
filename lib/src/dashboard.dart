library dashboard;

import 'package:flutter/material.dart';
import 'package:unhorizons/logic/values.dart';
import 'package:unhorizons/src/home_page.dart';
import 'package:unhorizons/widgets/widgets.dart';

part 'dashboard/side_drawer.dart';
part 'dashboard/side_profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    debugPrint("screen w : $screenWidth");
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) + 24.0;
    return Scaffold(
      body:  SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            ///------------------ SIDE DRAWER ------------------------
            const SideDrawer(),
            /// ----------------- HOME SCREEN ------------------------
            Expanded(
                child: Container(
                  color: Colors.grey.shade300.withOpacity(0.8),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const AppBarCoolUI(),

                      //const CourseRowListView(),
                      const SizedBox(height: 8.0,),
                      Container(
                        padding: const EdgeInsets.only(left: 18, right: 16),
                        child: Row(
                          children: const [
                            Text(
                              'Mes Cours',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.27,
                                color: AppTheme.darkerText,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Container(
                          //padding: const EdgeInsets.only(left: 18, right: 16),
                          child: CourseGridListView(
                            callBack: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
            /// ----------------- SIDE PROFILE -----------------------
            if(screenWidth > 1330)
            Container(
              margin: const EdgeInsets.only(left: 16,right: 8.0),
              width: 350,
              child: const SideUserInfoScreen(),
            )
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
