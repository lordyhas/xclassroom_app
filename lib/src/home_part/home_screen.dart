part of home_page;



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
      ifTrue: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: kIsWeb ? MediaQuery.of(context).size.width * 0.9 : null,
        child: Column(
          children:  <Widget>[
            HeaderBar(
              onDrawerTap: (){
                if(Scaffold.of(context).isDrawerOpen){
                  Scaffold.of(context).closeDrawer();
                }else{
                  Scaffold.of(context).openDrawer();
                }
              },
            ),
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
                        return  Container(child: PlanningView());
                    }
                  },
                ),
              ),
            ),


          ],
        ),
      ),
      /// Dashboard Web HomeScreen
      ifFalse: SizedBox(
        child: Container(
          color: Colors.grey.shade300.withOpacity(0.8),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const HeaderBar(
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
                                      //maxWidth: kMediumDimens,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment : Alignment.topCenter,
                                          child: Container(
                                            height: 50,
                                            decoration:  BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,

                                                colors: [
                                                  Colors.grey.shade300.withOpacity(0.8),
                                                  Colors.grey.shade300.withOpacity(0.8),
                                                  Colors.grey.shade300.withOpacity(0.6),
                                                  Colors.grey.shade300.withOpacity(0.5),
                                                  Colors.grey.shade300.withOpacity(0.5),
                                                  Colors.grey.shade300.withOpacity(0.4),
                                                  Colors.grey.shade300.withOpacity(0.3),
                                                  Colors.grey.shade300.withOpacity(0.3),
                                                  Colors.grey.shade300.withOpacity(0.2),
                                                  Colors.grey.shade300.withOpacity(0.2),
                                                  Colors.grey.shade300.withOpacity(0.2),
                                                  Colors.grey.shade300.withOpacity(0.1),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const PlanningView(),
                                      ],
                                    )
                                ),
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

