
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unhorizons/logic/values.dart';
import 'package:unhorizons/src/dashboard.dart';
import 'package:unhorizons/src/home_page.dart';

import 'package:unhorizons/logic/controller/authentication_bloc/auth_repository/setup.dart';
import 'package:unhorizons/logic/controller/authentication_bloc/authentication_bloc.dart';

import 'package:unhorizons/logic/controller/student_status_controller_cubit.dart';

import 'firebase_options.dart';
import 'logic/controller/login_bloc/login_cubit.dart';





part 'intro_page.dart';



void main() async {

  //await Firebase.initializeApp();

  await Firebase.initializeApp(
    name: "student-space",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
  );
  Bloc.observer = AppBlocObserver();
  //runApp(RootApp(authRepository: AuthenticationRepository(),));
  runApp(const InitApp());
}

class RootApp extends StatelessWidget {
  const RootApp({
    required this.authRepository,
    Key? key,
  }) : super(key: key);

  final AuthenticationRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authRepository: authRepository,
        ),
        child: const InitApp(),
      ),
    );
  }
}

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationController>(
          create: (context) => NavigationController(),
        ),
        BlocProvider<StudentController>(
          create: (context) => StudentController(),
        ),
        BlocProvider<SwitchHomeCubit>(
          create: (BuildContext context) => SwitchHomeCubit(),
        ),
      ],
      // horizons-student-space : hostspace HOST SPACE
      // espace etudiant horizons : eeh - ESPETUHOR
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'horizons-student-space',//HOST-SPACE
      theme: AppTheme.themeLight,
      home: const IntroPage(), /*BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          switch(state.status){
            case AuthenticationStatus.authenticated:

              break;
            case AuthenticationStatus.unauthenticated:

              break;
          }
          return ;
        }
      ),*/ //const RootApp() //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



