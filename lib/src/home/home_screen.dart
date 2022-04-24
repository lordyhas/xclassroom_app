part of 'home_page.dart';

class TabLayerView extends StatelessWidget {
  const TabLayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /*const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            '',//Category
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ),*/
        const SizedBox(
          height: 4,
        ),
        BlocBuilder<SwitchHomeCubit, CategoryType>(
          //context.read<SwitchHomeCubit>().state
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  ButtonTabBar(
                      categoryTypeData: CategoryType.home,
                      isSelected: state == CategoryType.home),
                  const SizedBox(
                    width: 16,
                  ),

                  //BlocProvider.of<SwitchHomeCubit>(context).state
                  ButtonTabBar(
                      categoryTypeData: CategoryType.course,
                      isSelected: state == CategoryType.course),
                  const SizedBox(
                    width: 16,
                  ),
                  ButtonTabBar(
                      categoryTypeData: CategoryType.planning,
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
    );
  }
}