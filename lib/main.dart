
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unhorizons/logic/values.dart';
import 'package:unhorizons/src/admission_page.dart';
import 'package:unhorizons/src/dashboard.dart';


import 'package:unhorizons/logic/controller/authentication_bloc/auth_repository/setup.dart';
import 'package:unhorizons/logic/controller/authentication_bloc/auth_controller_bloc.dart';
import 'package:unhorizons/logic/controller/student_authorization_controller_cubit.dart';
import 'package:unhorizons/src/home_page.dart';
import 'package:unhorizons/on_error_page.dart';
import 'package:unhorizons/src/setting_page.dart';
import 'package:url_strategy/url_strategy.dart';


part 'intro_page.dart';
part 'route_manager.dart';



void main() async {

  //await Firebase.initializeApp();

  /*await Firebase.initializeApp(
    //name: "student-space",
    options: DefaultFirebaseOptions.currentPlatform,
  );*/

  setPathUrlStrategy();
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

  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRepository,
      child: BlocProvider(
        create: (_) => AuthController(
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
        /*BlocProvider<NavigationController>(
          create: (context) => NavigationController(),
        ),*/
        BlocProvider<AuthorizationController>(
          create: (context) => AuthorizationController(),
        ),
        BlocProvider<NavigationController>(
          create: (BuildContext context) => NavigationController(),
        ),
      ],
      // horizons-student-space : hostspace HOST SPACE
      // espace etudiant horizons : eeh - ESPETUHOR
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'horizons-student-space',//HOST-SPACE
      theme: AppTheme.themeLight,
      //home: const IntroPage(),
      routerConfig: RouteManager.routeConfig,
    );



    /*BlocBuilder<AuthenticationBloc, AuthenticationState>(
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
  }
}



