part of dashboard;

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> with TickerProviderStateMixin{
  //late AnimationController controller;

  @override
  void initState() {
    super.initState();
    /*controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1)
    )..forward();*/
  }

  @override
  void dispose() {
    //controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child:  const Icon(FontAwesomeIcons.graduationCap),
                ),
                const SizedBox(width: 8.0,),
                const Text("unhorizons.org"),
              ],
            ),
          ),
           const Expanded(
              child: SingleChildScrollView(
                child: SizedBox(

                    child: Padding(
                      padding: EdgeInsets.only(),//symmetric(horizontal: 8.0),
                      child:DrawerContent(), //ItemScreenView(),

                    ),
                ),
              ),
          ),
          const Divider(),
          DrawerFooter(
            showProfileItem: !(Responsive.of(context).isMaxSize),
            showPlanningItem: true,
          ),
        ],
      ),
    );
  }
}

class DrawerFooter extends StatelessWidget {
  final bool showProfileItem;
  final bool showPlanningItem;
  const DrawerFooter({
    Key? key,
    this.showProfileItem = false,
    this.showPlanningItem = false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(showProfileItem)
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Mon Profile"),
          onTap: () {
            GoRouter.of(context).goNamed(UserInfoScreen.routeName);
            BlocProvider.of<NavigationController>(context).setProfileOpen();
          }
        ),
        if(showPlanningItem)
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text("Mes Course"),
                onTap: () => BlocProvider
                    .of<NavigationController>(context)
                    .change(NavigationScreen.course),
              ),
              ListTile(
                leading: const Icon(Icons.schedule_outlined),
                title: const Text("Horaire de la semaine"),
                onTap: () => BlocProvider
                    .of<NavigationController>(context)
                    .change(NavigationScreen.planning),
              ),
            ],
          ),


        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Paramètres"),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.mail),
          title: const Text("Inbox"),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text("À propos"),
          onTap: (){},
        ),
      ],
    );
  }
}


class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children:  [
          ExpansionTile(
            title: const Text("Admision"),
            children: [
              ListTile(
                title: const Text("Futur étudiant"),
                onTap: (){},
              ),
              ListTile(
                title: const Text("Mon Admission"),
                onTap: (){},
              ),
            ],
          ),
          ExpansionTile(
            title: const Text("Mes Études"),
            children: [
              ListTile(
                title: const Text("Mes Horaires"),
                onTap: () {},
              ),          ListTile(
                title: const Text("Mes Cours"),
                onTap: (){},
              ),
              ListTile(
                title: const Text("Cours déjà fait"),
                onTap: (){},
              ),
              ListTile(
                title: const Text("Calandrier academique"),
                onTap: (){},
              ),
            ],
          ),
          ExpansionTile(
            title: const Text("Documents Officiels"),
            children: [

              ExpansionTile(
                title: const Text("Attestations"),
                children: [
                  ListTile(
                    title: const Text("de Fréquentation"),
                    onTap: (){},
                  ),
                  ListTile(
                    title: const Text("de Réussite"),
                    onTap: (){},
                  ),ListTile(
                    title: const Text("de Recherche"),
                    onTap: (){},
                  ),ListTile(
                    title: const Text("de Stage"),
                    onTap: (){},
                  ),
                ],
              ),

              ListTile(
                title: const Text("Lettre de demande des stage"),
                onTap: (){},
              ),
              ListTile(
                title: const Text("Relevé de notes"),
                onTap: (){},
              ),
            ],
          ),
          ExpansionTile(
            title: const Text("Mon Results"),
            children: [
              ListTile(
                title: const Text("Mes Moyennes"),
                onTap: (){},
              ),
              ListTile(
                title: const Text("Introduire un recours"),
                onTap: (){},
              ),
            ],
          ),
        ],
      ),
    );
  }
}



