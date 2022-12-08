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
              child: SizedBox(

                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),//symmetric(horizontal: 8.0),
                    child: ItemScreenView(),
                  ),
              ),
          ),
          const Divider(),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Setting"),
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


