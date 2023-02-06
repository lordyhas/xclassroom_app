part of dashboard;


class HomeScreen extends StatefulWidget {
  static const routeName = "home_screen";
  static const routeUrl = "/home";
  const HomeScreen({Key? key, this.isOnWeb = false}) : super(key: key);

  final bool isOnWeb;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  BooleanBuilder(
      condition: () => Responsive.of(context).isPhone,

      /// Medium Mobile HomeScreen
      ifTrue: Container(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: kIsWeb ? MediaQuery.of(context).size.width * 0.9 : null,
          child: Column(
            children:  <Widget>[
              //getSearchBarUI(),
              const TabBarView(),
              Flexible(
                child:  Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: BlocBuilder<NavigationController, NavigationStateScreen>(
                    builder: (context, state) {
                      switch (state.screen) {
                        case NavigationScreen.home:
                          return const MenuContainerHome();
                        case NavigationScreen.course:
                          return Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //const CourseRowListView(),
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
                              Expanded(
                                child: Container(
                                  //padding: const EdgeInsets.only(left: 18, right: 16),
                                  child: CourseGridListView(
                                    callBack: () {},
                                  ),
                                ),
                              ),
                            ],
                          );

                        case NavigationScreen.planning:
                          return Column();
                      }
                    },
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
      /// Dashboard Web HomeScreen
      ifFalse: Container(
          child: Container(
            color: Colors.grey.shade300.withOpacity(0.8),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const AppBarCoolUI(
                  showDrawerButton: false,
                  //onDrawerTap: openDrawer,
                ),

                //const CourseRowListView(),
                const SizedBox(
                  height: 8.0,
                ),
                Flexible(
                  child: BlocBuilder<NavigationController, NavigationStateScreen>(
                    builder: (context, state) {
                      switch (state.screen) {
                        case NavigationScreen.home:
                        case NavigationScreen.course:
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 18, right: 16),
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
                                child: CourseGridListView(
                                  callBack: () {},
                                ),
                              ),
                            ],
                          );
                        case NavigationScreen.planning:
                          return Expanded(
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 18,
                                    right: 16,
                                  ),
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Horaire',
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
                                Center(
                                  child: Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: kMediumDimens,
                                      ),
                                      child: Column(
                                        children: const [
                                          SizedBox(
                                              height: 100,
                                              child: Placeholder()),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          SizedBox(
                                              height: 100,
                                              child: Placeholder()),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          SizedBox(
                                              height: 100,
                                              child: Placeholder()),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          SizedBox(
                                              height: 100,
                                              child: Placeholder()),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          SizedBox(
                                              height: 100,
                                              child: Placeholder()),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          );
                      }
                    },
                  ),
                ),

              ],
            ),
          ),
      ),
    );
  }
}


class TabBarView extends StatelessWidget {
  const TabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !kIsWeb ? null : MediaQuery
          .of(context)
          .size
          .width*0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 4),
          BlocBuilder<NavigationController, NavigationStateScreen>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: <Widget>[
                    TabBarButton(
                      title: "Home",
                        onTap: () => BlocProvider.of<NavigationController>(context)
                            .change(NavigationScreen.home),
                        isSelected: state.screen == NavigationScreen.home),
                    const SizedBox(width: 16),
                    TabBarButton(
                        title: "Cours",
                        onTap: () => BlocProvider.of<NavigationController>(context)
                              .change(NavigationScreen.course),
                        isSelected: state.screen == NavigationScreen.course),
                    const SizedBox(width: 16),
                    TabBarButton(
                        title: "Horaire",
                        onTap: () => BlocProvider
                            .of<NavigationController>(context)
                            .change(NavigationScreen.planning),
                        isSelected: state.screen == NavigationScreen.planning),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 4,),

        ],
      ),
    );
  }
}