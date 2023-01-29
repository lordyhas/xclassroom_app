part of  'main.dart';


class MainPage extends StatelessWidget {
  static const routeName = "root_page";
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("${Responsive.of(context).size} =========================");
    }
    return BooleanBuilder(
      condition: () => Responsive.of(context).isPhone,
      ifTrue: const HomePage(),
      ifFalse: const Dashboard(),
    );
  }
}

class IntroPage extends StatelessWidget {
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
              image: Image.asset("assets/design_course/lesson_vector0.png",),
              decoration: const PageDecoration(
                titleTextStyle: TextStyle(color: Colors.orange),
                bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
            ),
            PageViewModel(
              title: "Title of orange text and bold page",
              body: "This is a description on a page with an orange title and bold, big body.",
              image: Image.asset("assets/design_course/lesson_vector1.jpg",),
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
              image: Image.asset("assets/design_course/lesson_vector4.jpg",),
            ),
            PageViewModel(
              title: "Title of custom button page",
              body: "This is a description on a page with a custom button below.",
              image: Image.asset("assets/design_course/lesson_vector3.jpg"),
            ),
            PageViewModel(
              reverse: true,
              title: "Welcome to Student Space",
              body: "Login ot register to continue.",

              //body: "This is a description on a page with a custom button below.",
              image: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400,),
                    child: const Login1Widget(),
                  ),
                ),
              ),
            ),
          ],
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Text("Next"),
          done: const Text("Login"),
          onDone: () {
            Navigator.pushReplacement(context, MaterialPageRoute<void>(
              builder: (BuildContext context) => const MainPage(),
            ),);

            debugPrint('XXXVIII');
          },
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



class Login1Widget extends StatelessWidget {
  const Login1Widget({Key? key}) : super(key: key);

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
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Phone / Email / Account',
                labelText: 'account number',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 30,
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Please enter your account password',
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
              children: const <Widget>[
                Expanded(flex: 1, child: Text('forget password')),
                Expanded(flex: 0, child: Text('Register Account')),
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
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FontAwesomeIcons.google),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FontAwesomeIcons.yahoo),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FontAwesomeIcons.amazon),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FontAwesomeIcons.facebook),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  }
}
