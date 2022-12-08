import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unhorizons/logic/values.dart';
import 'package:unhorizons/src/dashboard.dart';
import 'package:unhorizons/src/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /*BlocProvider<Styles>(
          create: (BuildContext context) => Styles(),
        ),*/

        BlocProvider<SwitchHomeCubit>(
          create: (BuildContext context) => SwitchHomeCubit(),
        ),
      ],
      // horizons-student-space : hostspace HOST SPACE
      // espace etudiant horizons : eeh - ESPETUHOR
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'horizons-student-space ',
          theme: AppTheme.themeLight,
          home: const RootApp() //const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
    );
  }
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("${Responsive.of(context).size} =========================");
    }
    return BooleanBuilder(
      condition: () => Responsive.of(context).isPhone,
      ifTrue: const HomePage(),
      ifFalse: const Dashboard(),
    );
  }
}

