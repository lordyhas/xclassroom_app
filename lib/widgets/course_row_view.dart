import 'package:flutter/foundation.dart';
import 'package:unhorizons/logic/values.dart';
import 'package:unhorizons/main.dart';
import 'package:flutter/material.dart';


class CourseRowListView extends StatefulWidget {
  const CourseRowListView({Key? key,}) : super(key: key);

  //final Function? callBack;
  @override
  _CourseRowListViewState createState() => _CourseRowListViewState();
}

class _CourseRowListViewState extends State<CourseRowListView>
    with TickerProviderStateMixin {
   late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 20));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: 120,
        width: double.infinity,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = categoryList.length > 10
                      ? 10
                      : categoryList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return CourseListItemView(
                    category: categoryList[index],
                    animation: animation,
                    animationController: animationController,
                    callback: () {
                      //widget.callBack!();
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  static List<CourseCategory> categoryList = <CourseCategory>[
    CourseCategory(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Programmation OO',
      lessonCredit: 2,
      //hours: 25,
      rating: 4.3,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Analyse Numerique',
      lessonCredit: 1,
      //hours: 18,
      rating: 4.6,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'User interface Design',
      lessonCredit: 4,
      //hours: 25,
      rating: 4.3,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Algebre',
      lessonCredit: 3,
      //hours: 18,
      rating: 4.6,
    ),
  ];
}

class CourseListItemView extends StatelessWidget {
  const CourseListItemView({
      required this.category,
      required this.animationController,
      required this.animation,
      this.callback, Key? key,})
      : super(key: key);

  final VoidCallback? callback;
  final CourseCategory category;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              hoverColor: Colors.green.shade200.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16.0),
              splashColor: Colors.transparent,
              onTap: () {
                callback!();
              },
              child: SizedBox(
                width: kIsWeb? 320 : 280,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 48,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  const SizedBox(
                                    width:  48 + 24.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Text(
                                              category.title,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                letterSpacing: 0.27,
                                                color: AppTheme
                                                    .darkerText,

                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            child: SizedBox(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16, bottom: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${category.lessonCredit} credit',
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12,
                                                    letterSpacing: 0.27,
                                                    color: AppTheme
                                                        .grey,
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      '${category.rating}',
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w200,
                                                        fontSize: 18,
                                                        letterSpacing: 0.27,
                                                        color:
                                                            AppTheme
                                                                .grey,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color:
                                                          Theme.of(context).primaryColor,
                                                      size: 20,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16, right: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '${category.lessonCredit*15} heures',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    letterSpacing: 0.27,
                                                    color: Theme.of(context).primaryColor,
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context).primaryColor,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8.0)),
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(
                                                            4.0),
                                                    child: Icon(
                                                      Icons.add,
                                                      color:
                                                          AppTheme
                                                              .nearlyWhite,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 24, bottom: 24, left: 16),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                              child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Image.asset(category.imagePath)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
