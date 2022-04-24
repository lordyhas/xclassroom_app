import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter/material.dart';

import '../../data_logic/controller/bloc_controller.dart';
import '../../data_logic/values.dart';
import '../../data_logic/values/colors_theme.dart';

import '../user_info_screen.dart';
import '../menu_wrapable_widget.dart';
import 'course_grid_view.dart';
import 'course_row_view.dart';

part 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
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
          SizedBox(
            height: MediaQuery
                .of(context)
                .padding
                .top,
          ),
          const AppBarCoolUI(),
          Expanded(
            child: Container(
              child: SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: Column(
                  children: const <Widget>[
                    //getSearchBarUI(),
                    TabLayerView(),
                    Flexible(
                      child: ScreenHome(),
                    ),
                  ],
                ),
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
            width: MediaQuery
                .of(context)
                .size
                .width * 0.75,
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
                  'Université',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: AppTheme.grey,
                  ),
                ),
                Text(
                  'Nouveaux Horizons',
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



class ButtonTabBar extends StatelessWidget {
  const ButtonTabBar({Key? key,
    required this.categoryTypeData,
    required this.isSelected
  }) : super(key: key);

  final CategoryType categoryTypeData;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    String txt = '';
    if (CategoryType.home == categoryTypeData) {
      txt = 'Home';
    } else if (CategoryType.course == categoryTypeData) {
      txt = 'Cours';
    } else if (CategoryType.planning == categoryTypeData) {
      txt = 'Horaire ';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.nearlyBlue
                : AppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: AppTheme.nearlyBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              BlocProvider.of<SwitchHomeCubit>(context).change(
                  categoryTypeData);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? AppTheme.nearlyWhite
                        : AppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: BlocBuilder<SwitchHomeCubit, CategoryType>(
        builder: (context, state) {
          switch (state) {
            case CategoryType.home:
              return const MenuContainerHome();

            case CategoryType.course:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CourseRowListView(),
                  const Padding(
                    padding: EdgeInsets.only(left: 18, right: 16),
                    child: Text(
                      'Mes Cours',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 0.27,
                        color: AppTheme.darkerText,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, right: 16),
                      child: CourseGridListView(
                        callBack: () {},
                      ),
                    ),
                  )
                ],
              );

            case CategoryType.planning:
              return Column();
          }
        },
      ),
    );
  }
}


class MenuContainerHome extends StatefulWidget {
  const MenuContainerHome({Key? key}) : super(key: key);

  @override
  _MenuContainerHomeState createState() => _MenuContainerHomeState();
}

class _MenuContainerHomeState extends State<MenuContainerHome>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        //padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: <Widget>[
          MenuAnimatedContainer(
            startDelayFraction: 0.00,
            controller: controller,
            child: MenuWrapped(
              menuItem: MenuWrappedItem(
                iconData: Icons.person_outline,
                title: 'CORPS ACADEMIQUE',
                items: [
                  MenuWrappedItem(
                    onTap: () => print('++++++++++++++++++++++++++++'),
                    iconData: Icons.chat,
                    title: "Organe de l'UNH",
                    items: [],
                  ),
                  MenuWrappedItem(
                    iconData: Icons.chat,
                    title: 'Le rectorat',
                    onTap: () {},
                    //items: [],
                  ),
                  MenuWrappedItem(
                    iconData: Icons.chat,
                    title: 'Corps enseignant',
                    onTap: () {},
                    //items: [],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          MenuAnimatedContainer(
            startDelayFraction: 0.1,
            controller: controller,
            child: MenuWrapped(
              menuItem: MenuWrappedItem(

                title: 'INFRASTRUCTURE',
                items: [],
              ),
            ),
          ),
          const SizedBox(height: 24),
          MenuAnimatedContainer(
            startDelayFraction: 0.1,
            controller: controller,
            child: MenuWrapped(
              menuItem: MenuWrappedItem(
                iconData: Icons.ac_unit,
                title: "LES ETUDES A L'UNH",
                items: [
                  MenuWrappedItem(
                    title: "Admission",
                    items: [],
                  ),
                  MenuWrappedItem(
                    title: "Bourse d'etudes",
                    //items: [],
                  ),
                  MenuWrappedItem(
                    title: "La pedagogie",
                    //items: [],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          MenuAnimatedContainer(
            startDelayFraction: 0.2,
            controller: controller,
            child: MenuWrapped(
              menuItem: MenuWrappedItem(
                iconData: Icons.book_outlined,
                title: 'BIBLIOTHEQUE',
                items: [
                  MenuWrappedItem(
                    title: 'Nos ressources',
                    items: [],
                  ),
                  MenuWrappedItem(
                    title: "La bibliotheque numerique (e-Library)",
                    items: [],
                  ),
                  MenuWrappedItem(
                    title: 'Notre carte postale ',
                    items: [],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

