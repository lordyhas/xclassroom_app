part of dashboard;

class SideUserInfoScreen extends StatelessWidget {
  const SideUserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 8.0),
      width: 350,
      child: const UserInfoScreen(),
    );
  }
}


class UserInfoScreen extends StatefulWidget {
  static const routeName = "user-profile";
  //static const routeUrl = "/admission/introduction";
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  int percent = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            constraints: const BoxConstraints(
              maxWidth: kMediumDimens,
            ),
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
                    const Text(
                      "Génie Logiciel",
                      style:
                      TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0,),
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
                        const SizedBox(width: 8.0,),
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
                        const SizedBox(width: 8.0,),
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
                  Row(children: const [Text("Mes Cours & Notes"),],),

                  const SizedBox(height: 8.0,),
                  Column(
                    children: popularCourseList
                        .map((category) => CourseListTile(category: category))
                        .toList()..length = 7,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

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


