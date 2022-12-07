
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unhorizons/logic/values.dart';
import 'package:utils_component/utils_component.dart';

class CourseGridListView extends StatefulWidget {
  const CourseGridListView({Key? key, this.callBack}) : super(key: key);

  final VoidCallback? callBack;
  @override
  _CourseGridListViewState createState() => _CourseGridListViewState();
}

class _CourseGridListViewState extends State<CourseGridListView>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Scrollbar(
              thumbVisibility: true,
              controller: _scrollController,
              child: BooleanBuilder(
                check: kIsWeb,
                ifTrue: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: Wrap(
                      //runAlignment: WrapAlignment.spaceBetween,
                      //alignment: WrapAlignment.center,
                      //spacing: 16.0,
                      //runSpacing: 32.0,
                      children: listOfCourseView()..addAll(listOfCourseView()
                        ..removeAt(0)..reversed),
                    ),
                  ),
                ),
                ifFalse: GridView(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: kIsWeb ? 4 : 2,
                    mainAxisSpacing: 32.0,
                    crossAxisSpacing: 32.0,
                    childAspectRatio: kIsWeb ? 0.99 : 0.8,
                  ),
                  children: listOfCourseView(),

                ),
              ),
            );
          }
        },
      ),
    );
  }

  List<Widget> listOfCourseView() => List<Widget>.generate(
    popularCourseList.length,
        (int index) {
      final int count = popularCourseList.length;
      final Animation<double> animation =
      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval((1 / count) * index, 1.0,
              curve: Curves.fastOutSlowIn),
        ),
      );
      animationController.forward();
      return BooleanBuilder(
        check: kIsWeb,
        ifTrue:  Container(
          margin: const EdgeInsets.all(16.0),
          height: 250,
          width: 230,
          child: CourseGridItemView(
            callback: widget.callBack,
            category: popularCourseList[index],
            animation: animation,
            animationController: animationController,
          ),
        ),
        ifFalse: CourseGridItemView(
          callback: widget.callBack,
          category: popularCourseList[index],
          animation: animation,
          animationController: animationController,
        ),
      );
    },
  );


  static List<CourseCategory> popularCourseList = <CourseCategory>[
    CourseCategory(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Entreprenariat & OGE',
      lessonCredit: 2,
      //hours: 25,
      rating: 4.8,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Pragrammation Web',
      lessonCredit: 8,
      //hours: 208,
      rating: 4.9,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Education à la citoyenneté',
      lessonCredit: 1,
      //hours: 25,
      rating: 4.8,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Analyse Numérique',
      lessonCredit: 2,
      //hours: 208,
      rating: 4.9,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Statistique & Proba',
      lessonCredit: 2,
      //hours: 208,
      rating: 4.9,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Algorithmique avancée',
      lessonCredit: 8,
      //hours: 208,
      rating: 4.9,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Analyse Numérique',
      lessonCredit: 2,
      //hours: 208,
      rating: 4.9,
    ),

    CourseCategory(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Structure de donneés',
      lessonCredit: 2,
      //hours: 208,
      rating: 4.9,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Expression Orale et Ecrit',
      lessonCredit: 8,
      //hours: 208,
      rating: 4.9,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Machine Electrique',
      lessonCredit: 1,
      //hours: 25,
      rating: 4.8,
    ),
    CourseCategory(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Méchanique Rationnelle',
      lessonCredit: 2,
      //hours: 208,
      rating: 4.9,
    ),
  ];
}

class CourseGridItemView extends StatelessWidget {
  const CourseGridItemView({
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
    bool onHover = false;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: callback,
              //hoverColor: Colors.transparent,
              hoverColor: Colors.cyan.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16.0),
              onHover:(bool hover){
                onHover = hover;
              },
              mouseCursor: MaterialStateMouseCursor.clickable,
              child: SizedBox(
                //height: 280,
                //width: 100,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                                // border: new Border.all(
                                //     color: DesignCourseAppTheme.notWhite),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16, left: 16, right: 16),
                                          child: Text(
                                            category.title,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              letterSpacing: 0.27,
                                              color: AppTheme
                                                  .darkerText,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8,
                                              left: 16,
                                              right: 16,
                                              bottom: 8),
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
                                                    color: Theme.of(context).primaryColor,
                                                    size: 20,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    //width: 48,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 24, right: 16, left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: AppTheme.grey
                                      .withOpacity(0.2),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 6.0),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            child: AspectRatio(
                                aspectRatio: 1.28,
                                child: Image.asset(category.imagePath)),
                          ),
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
