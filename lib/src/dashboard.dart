part of home;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {

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
  int percent = 70;

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Scaffold(

      body:  SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              color: Colors.grey.withOpacity(0.1),
              padding: const EdgeInsets.only(right: 16),
              width: 300,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.only(bottom: 64.0),
                    height: 100,
                    child: Row(
                      children: [
                        Ink(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child:  const Icon(Icons.ac_unit_sharp),
                        ),
                        SizedBox(width: 8.0,),

                        const Text("unhorizons.org"),



                      ],
                    ),
                  ),
                  Column(
                      children: [

                        MenuAnimatedContainer(
                          startDelayFraction: 0.00,
                          controller: controller,
                          child: MenuWrapped(
                            menuItem: MenuWrappedItem(
                              iconData: Icons.person_outline,
                              title: 'CORPS ACADEMIQUE',
                              items: [
                                MenuWrappedItem(
                                  onTap: () => debugPrint('++++++++++++++++++++++++++++'),
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


                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: Text("Setting"),
                          onTap: (){},
                        ),
                        ListTile(
                          leading: const Icon(Icons.mail),
                          title: const Text("Inbox"),
                          onTap: (){},
                        ),

                        ListTile(
                          leading: const Icon(Icons.info_outline),
                          title: const Text("About"),
                          onTap: (){},
                        ),


                      ]
                  ),
                ],
              ),
            ),
            /// ------------------------------------------------------
            Expanded(
                child: Container(
                  color: Colors.grey.shade300.withOpacity(0.8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const AppBarCoolUI(),

                      //const CourseRowListView(),
                      const SizedBox(height: 8.0,),
                      Container(
                        padding: const EdgeInsets.only(left: 18, right: 16),
                        child: const Text(
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, right: 16),
                          child: CourseGridListView(
                            callBack: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
            /// ------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(left: 16,right: 8.0),
              width: 350,
              child: Scaffold(
                body: Column(
                  children: [
                    SizedBox(
                      height: AppBar().preferredSize.height,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(

                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "My Profile",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_horiz)),
                              ],
                            ),
                            Row(
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: "$percent%",
                                        style: const TextStyle(
                                          color: Colors.green,
                                        ),
                                        children: const [
                                          TextSpan(text: 'Complete your profile')
                                        ]
                                    ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 16.0,
                            ),

                            decoration: BoxDecoration(
                              border:  Border.all(color: Colors.green,
                                width: 4,),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.asset(
                                  'assets/avatar/profile_avatar3.jpg'),
                            ),
                          ),
                          Column(
                            children: [
                              const Text(
                                "TSHELEKA KAJILA Hassan",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Sciences Informatiques",
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                              Text(
                                "Genie Logiciel",
                                style:
                                TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Card(
                        color: Colors.grey.shade200.withOpacity(0.5),
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          //height: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Ink(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.circular(100.0),
                                    ),
                                    child: const Icon(Icons.menu_book),

                                  ),
                                  SizedBox(width: 8.0,),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        Text("16",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("Cours",textAlign: TextAlign.start,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                color: Colors.black54,
                                height: 30,
                                width: 1,
                              ),
                              Row(
                                children: [
                                  Ink(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius: BorderRadius.circular(100.0),
                                    ),
                                    child: const Icon(Icons.person_outline),

                                  ),
                                  SizedBox(width: 8.0,),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        Text("7",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("Prof", textAlign: TextAlign.start,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(children: const[Text("My Course & Notes"),],),

                            const SizedBox(height: 8.0,),
                            Column(
                              children: [
                                for (var i = 0; i <= 8; i++)
                                  Container(
                                    margin: EdgeInsets.all(8.0),
                                    height: 45,
                                    child: Placeholder(),
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
