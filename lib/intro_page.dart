part of  'main.dart';



class IntroPage extends StatelessWidget {
  static const routeName = "intro_page";
  static const routeUrl = "/myspace/login";
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BooleanBuilder(
      condition: () => true,
      ifTrue: Container(
        //constraints: const BoxConstraints(maxWidth: 700,),
        width: 500,
        child: IntroductionScreen(

          pages: [
            PageViewModel(
              title: "Title of orange text and bold page",
              body: "This is a description on a page with an orange title and bold, big body.",
              image: Image.asset("assets/vectors/vector_cap2b.png",),
              decoration: const PageDecoration(
                titleTextStyle: TextStyle(color: Colors.orange),
                bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
            ),
            PageViewModel(
              title: "Title of orange text and bold page",
              body: "This is a description on a page with an orange title and bold, big body.",
              image: Image.asset("assets/design_course/lesson_vector0.png",),
              decoration: const PageDecoration(
                titleTextStyle: TextStyle(color: Colors.orange),
                bodyTextStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                ),
              ),
            ),
            PageViewModel(

              title: "Title of custom button page",
              body: "This is a description on a page with a custom button below.",
              image: Image.asset("assets/vectors/vector2.png",),
            ),
            PageViewModel(
              title: "Title of custom button page",
              body: "This is a description on a page with a custom button below.",
              image: Image.asset("assets/vectors/vector3.png"),
            ),
            PageViewModel(
              reverse: true,
              titleWidget: SizedBox.square(
                dimension: 250,
                child: Image.asset("assets/vectors/vector_cap2a.png"),),
              //title: "Welcome to Student Space",
              body: "Welcome to Student Space \nLogin or register to continue.",

              //body: "This is a description on a page with a custom button below.",
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400,),
                    child: const LoginView(),
                  ),
                ),
              ),
            ),
          ],
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Text("Next"),
          done: const Text("Login"),
          onDone: () => GoRouter.of(context).goNamed(HomeScreen.routeName),


          baseBtnStyle: TextButton.styleFrom(
            backgroundColor: Colors.white,
          ),

          skipStyle: TextButton.styleFrom(primary: Colors.red,),
          doneStyle: TextButton.styleFrom(primary: Colors.green,),
          nextStyle: TextButton.styleFrom(primary: Colors.blue,),
        ),
      ),
      ifFalse: Column(
        children: const [
          Text("Home"),
          SizedBox(height: 50, width: 200, child: Placeholder()),
        ],
      ),
    );
  }
}



class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              'Account login',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 30,
            ),
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.person,
                  color: Colors.grey,
                ),
                hintText: 'UID / Email / Phone',
                labelText: 'account id',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 30,
            ),
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              //keyboardType: TextInputType.emailAddress,
              obscureText: showPassword,
              decoration: InputDecoration(

                prefixIcon: const Icon(Icons.lock_outline,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(showPassword? CupertinoIcons.eye_slash : CupertinoIcons.eye),
                  onPressed: (){
                    setState(() {
                      showPassword = !showPassword;
                    });

                  },
                ),
                hintText: 'Please enter your password',
                labelText: 'password',
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(

                  child: TextButton(
                    onPressed: () {  },
                    child: const Text('Forget password'),
                  ),
                ),
                Container(

                  child: TextButton(
                    onPressed: () {  },
                    child: const Text('Créer un compte'),),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                const Text('Quick Login'),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(FontAwesomeIcons.google),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(FontAwesomeIcons.yahoo),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(FontAwesomeIcons.amazon),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(FontAwesomeIcons.facebook),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  }
}
