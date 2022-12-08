library home;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unhorizons/logic/values/dimens.dart';
import 'package:unhorizons/widgets/widgets.dart';


import 'package:unhorizons/logic/values.dart';

import 'package:unhorizons/res.dart';
import '../widgets/menu_wrapable_widget.dart';
import '../widgets/course_grid_view.dart';
import '../widgets/course_row_view.dart';

part 'home/home_screen.dart';
part 'home/menu_home.dart';
part 'user_info_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late CategoryType categoryType;

  @override
  void initState() {
    super.initState();
    //categoryType = BlocProvider.of<SwitchHomeCubit>(context).state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top,),
          const AppBarCoolUI(),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: kIsWeb ? MediaQuery.of(context).size.width * 0.9 : null,
              child: Column(
                children: const <Widget>[
                  //getSearchBarUI(),
                  TabBarView(),
                  Flexible(child: ScreenHome()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _moveTo() {
    /*Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );*/
  }


  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: const TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppTheme.nearlyBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Search for course',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

}


class AppBarCoolUI extends StatelessWidget {
  const AppBarCoolUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "University", //'Université',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: AppTheme.grey,
                  ),
                ),
                Text(
                  "XXXXX XXXXX",//'Nouveaux Horizons',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: AppTheme.darkerText,
                  ),
                ),
              ],
            ),
          ),
          if(!kIsWeb)
          SizedBox(
            width: 60,
            height: 60,
            child: InkWell(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const UserInfoScreen(),
                    ),
                  );
                },
                child: Image.asset('assets/design_course/userImage.png')
            ),
          )
        ],
      ),
    );
  }
}


