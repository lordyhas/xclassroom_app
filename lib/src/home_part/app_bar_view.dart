part of home_page;




class HeaderBar extends StatelessWidget {
  final bool showDrawerButton;
  final void Function()? onDrawerTap;
  const HeaderBar({
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
                  "Lambda Omega",//'Nouveaux Horizons',
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
                  //GoRouter.of(context).goNamed(UserInfoScreen.routeName);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset('assets/design_course/userImage.png'),
                ),
              ),
            )
        ],
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