import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unhorizons/src/home/home_page.dart';

import 'data_logic/controller/switch_home_bloc/switch_home_cubit.dart';

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
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UNH',
          theme: ThemeData(
            primaryColor: Colors.cyan.shade800,
          ),
          home:
              const HomePage() //const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
    );
  }
}
