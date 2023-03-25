part of 'main.dart';

class RouteManager{
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter routeConfig =  GoRouter(
    navigatorKey: _rootNavigatorKey,

    errorBuilder: (context, state) => OnErrorPage(
      error: state.error,
    ),
    redirect: (context, state) {
      return null;

    },
    //observers: ,
    initialLocation: IntroPage.routeUrl, //HomeScreen.routeUrl+"/admission",
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => Dashboard(child: child,),
        routes: [
          GoRoute(
              name: HomeScreen.routeName,
              path: HomeScreen.routeUrl,
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  //parentNavigatorKey: _rootNavigatorKey,
                  name: UserInfoScreen.routeName,
                  path: "user",
                  builder: (context, state) => const UserInfoScreen(),
                ),
                GoRoute(
                  //parentNavigatorKey: _rootNavigatorKey,
                  name: AdmissionScreen.routeName,
                  path: "admission",
                  builder: (context, state) => const AdmissionScreen(),
                ),
                GoRoute(
                  //parentNavigatorKey: _rootNavigatorKey,
                  name: SettingPage.routeName,
                  path: "setting",
                  builder: (context, state) => const SettingPage(),
                ),
              ]
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: IntroPage.routeName,
        path: IntroPage.routeUrl,
        builder: (context, state) => const IntroPage(),
      ),

    ],
  );

}