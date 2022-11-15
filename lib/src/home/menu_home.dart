part of home;


class MenuContainerHome extends StatefulWidget {
  const MenuContainerHome({Key? key}) : super(key: key);

  @override
  _MenuContainerHomeState createState() => _MenuContainerHomeState();
}

class _MenuContainerHomeState extends State<MenuContainerHome>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        padding: !kIsWeb ? null : const EdgeInsets.symmetric(horizontal: 360),
        children: <Widget>[
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
        ],
      ),
    );
  }
}

