part of home;


class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: BlocBuilder<SwitchHomeCubit, CategoryType>(
        builder: (context, state) {
          switch (state) {
            case CategoryType.home:
              return const MenuContainerHome();

            case CategoryType.course:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CourseRowListView(),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18, right: 16),
                      child: CourseGridListView(
                        callBack: () {},
                      ),
                    ),
                  )
                ],
              );

            case CategoryType.planning:
              return Column();
          }
        },
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
          .width*0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 4,
          ),
          BlocBuilder<SwitchHomeCubit, CategoryType>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    TabBarButton(
                      title: "Home",
                        onTap: () => BlocProvider
                            .of<SwitchHomeCubit>(context)
                            .change(CategoryType.home),
                        isSelected: state == CategoryType.home),
                    const SizedBox(width: 16),

                    TabBarButton(
                        title: "Cours",
                        onTap: () => BlocProvider
                            .of<SwitchHomeCubit>(context)
                            .change(CategoryType.course),
                        isSelected: state == CategoryType.course),
                    const SizedBox(width: 16),
                    TabBarButton(
                        title: "Horaire",
                        onTap: () => BlocProvider
                            .of<SwitchHomeCubit>(context)
                            .change(CategoryType.planning),
                        isSelected: state == CategoryType.planning),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 4,
          ),

        ],
      ),
    );
  }
}