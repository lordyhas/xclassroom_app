part of dashboard;

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1)
    )..forward();
  }

  @override
  void dispose() {
    controller.dispose();
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
                  child:  const Icon(Icons.ac_unit_sharp),
                ),
                const SizedBox(width: 8.0,),
                const Text("unhorizons.org"),



              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    MenuAnimatedContainer(
                      startDelayFraction: 0.00,
                      controller: controller,
                      child: MenuWrapped(
                        menuItem: MenuWrappedItem(
                          //iconData: Icons.co_present,
                          title: 'CORPS ACADEMIQUE',
                          items: [
                            MenuWrappedItem(
                              onTap: () => debugPrint('++++++++++++++++++++++++++++'),
                              //iconData: Icons.chat,
                              title: "Organe de l'UNH",
                              items: [],
                            ),
                            MenuWrappedItem(
                              //iconData: Icons.chat,
                              title: 'Le rectorat',
                              onTap: () {},
                              //items: [],
                            ),
                            MenuWrappedItem(
                              //iconData: Icons.chat,
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
                          iconData: Icons.account_balance_outlined,
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
                          iconData: Icons.school,
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


                  ]
              ),
            ),
          ),
          const Divider(),
          Column(
            children: [
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
            ],
          ),
        ],
      ),
    );
  }
}


