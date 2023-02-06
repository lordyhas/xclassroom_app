part of dashboard;

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.child}) : super(key: key);

  final Widget? child;

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
      drawer: Drawer(
        child: Column(
          children:  [
            DrawerHeader(child: SizedBox.square(
              dimension: 200,
              child: Image.asset("assets/vectors/vector_cap2a.png"),),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: DrawerContent(),
              ),
            ),
            const Divider(),
            const DrawerFooter(showProfileItem: true,),
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          return Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top,),
              AppBarCoolUI(
                onDrawerTap: (){
                  if(Scaffold.of(context).isDrawerOpen){
                    Scaffold.of(context).closeDrawer();
                  }else{
                    Scaffold.of(context).openDrawer();
                  }
                },
              ),
              ///------ -----
              Flexible(
                child: SizedBox(child: widget.child,),
              ),

            ],
          );
        }
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
  final bool showDrawerButton;
  final void Function()? onDrawerTap;
  const AppBarCoolUI({
    this.showDrawerButton = true,
    this.onDrawerTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 18),
      child: Row(
        children: <Widget>[
          if(showDrawerButton)
          Padding(
            padding: const EdgeInsets.only(),
            child: IconButton(
                onPressed: onDrawerTap,
                icon: const Icon(Icons.menu)),
          ),
          const SizedBox(width: 18,),
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
                  GoRouter.of(context).goNamed(UserInfoScreen.routeName);
                },
                child: Image.asset('assets/design_course/userImage.png')
            ),
          )
        ],
      ),
    );
  }
}


