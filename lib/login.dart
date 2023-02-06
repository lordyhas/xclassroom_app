/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

import 'package:unhorizons/logic/controller/authentication_bloc/auth_repository/setup.dart';
import 'package:unhorizons/logic/controller/authentication_bloc/auth_controller_bloc.dart';

import 'logic/controller/login_bloc/login_cubit.dart';
import 'logic/values.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;

  bool  underline = true;


  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
      setState(() {});
    });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool createAccount = false;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
      ));
    }
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:

            break;
          default:
            break;
        }
      },
      child: BlocProvider(
        create: (_) => LoginCubit(
          context.read<AuthenticationRepository>(),
        ),
        child: Container(

          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SizedBox(
              child: BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.status.isSubmissionFailure) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Authentication Failure'),
                        ),
                      );
                  }
                },
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(),

                        Row(
                          children: const [
                            SizedBox(),
                            Spacer(),
                            SelectableText(
                              " Espace Etudiant",
                              //'Welcome to Tsheleka KodishApp',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                //color: Theme.of(context).primaryColor.withOpacity(.7),
                              ),
                            ),
                            Spacer(),

                            SizedBox(),
                          ],
                        ),
                        const SizedBox(),
                        const _EmailInput(
                          key: Key('loginForm_emailInput'),
                        ),
                        const _PasswordInput(
                          key: Key('loginForm_passwordInput'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //const ButtonLogin(text: 'Connecter',),
                            SizedBox(width: size.width / 25),
                            Container(
                              //width: 150,
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: (){
                                    Log.i('Forgotten password! button pressed',);

                                  },

                                  onHover: (value){
                                    setState(() {
                                      underline = value;
                                    });
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Mot de passe oublié !',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        decoration: underline
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                      ),
                                      //recognizer: TapGestureRecognizer()..onTap = ,
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                        //const SizedBox(),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 32.0
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              _GoogleLoginButton(),
                              SizedBox(height: 8.0,),
                              _FacebookLoginButton(),
                            ],
                          ),
                        ),
                        // const SizedBox(),
                        RichText(
                          text: const TextSpan(
                            text: 'S\'enregistrer',
                            style: TextStyle(
                              //color: Colors.white70, //Theme.of(context).primaryColor.withOpacity(.8),
                              fontSize: 15,
                            ),
                            //recognizer: TapGestureRecognizer()..onTap = (){},
                            //mouseCursor: SystemMouseCursors.text,
                          ),
                        ),
                        const SizedBox(),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: IconButton(
                            onPressed: !kIsWeb ? (){
                              /*goto(context,
                                      page : const SettingPage(),
                                      routeName:  SettingPage.routeName
                                  );*/
                            } : null,
                            icon: const Icon(CupertinoIcons.gear_solid,
                              color:  !kIsWeb
                                  ? Colors.white
                                  : Colors.transparent,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}

class _NameInput extends StatelessWidget {
  const _NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return _InputField(key: key,
          icon: Icons.account_circle_outlined,
          hintText: 'User name...',
          onChanged: (email){
            ///TODO : get name enter here, for mail without name
          },
          //errorText: state.email.invalid ? 'invalid email' : null,
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return _InputField(
          key: key,
          icon: Icons.email_outlined,
          hintText: 'Email...',
          isEmail: true,
          onChanged: (email) => BlocProvider
              .of<LoginCubit>(context)
              .emailChanged(email),
          errorText: state.email.invalid ? 'invalid email' : null,
        );
      },
    );
  }
}

class _PasswordInput extends StatefulWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return _InputField(
          key: widget.key,
          icon: Icons.lock_outline,
          hintText:  'Password...',
          isPassword: showPassword,
          onChanged: (password) =>
              BlocProvider.of<LoginCubit>(context).passwordChanged(password),
          errorText: state.password.invalid ? 'invalid password' : null,
          suffixIcon: IconButton(
            icon: Icon(showPassword? CupertinoIcons.eye_slash : CupertinoIcons.eye),
            onPressed: (){
              setState(() {
                showPassword = !showPassword;
              });

            },
          ),
        );
      },
    );
  }
}




class _GoogleLoginButton extends StatelessWidget {
  final String text;
  const _GoogleLoginButton({this.text = "Sign in with Google"});
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width *0.75;
    final theme = Theme.of(context);

    Widget googleOutlineButton = OutlinedButton(
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
      //BlocProvider.of<LoginCubit>(context).logInWithGoogle(),
      style: OutlinedButton.styleFrom(

        //backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        side: BorderSide(
          color: theme.colorScheme.primary,
        ),

      ),



      //highlightedBorderColor: theme.colorScheme.primaryVariant,
      //highlightColor: theme.colorScheme.primaryVariant.withOpacity(0.1),

      //borderSide:
      child:  Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(FontAwesomeIcons.google),
            const Spacer(),
            Text(text),
            const Spacer(),
            const Icon(FontAwesomeIcons.google, color: Colors.transparent,),


          ],
        ),
      ),

    );

    return Container(
      //width: width,
        child: googleOutlineButton);
  }
}

class _FacebookLoginButton extends StatelessWidget {
  final String text;
  const _FacebookLoginButton({this.text= "Sign in with Facebook"});
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width *0.75;
    final theme = Theme.of(context);


    Widget facebookOutlineButton = OutlinedButton(
        key: const Key('loginForm_facebookLogin_outlineButton'),
        style: OutlinedButton.styleFrom(
          //backgroundColor: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          side: BorderSide(
            color: theme.colorScheme.primary,
          ),
        ),
        //style: ButtonStyle(),
        //color: theme.colorScheme.primary,
        //textColor: theme.colorScheme.primary,
        //highlightedBorderColor: theme.colorScheme.primaryVariant,
        //highlightColor: theme.colorScheme.primaryVariant.withOpacity(0.1),

        //icon: Icon(FontAwesomeIcons.facebookF),
        //label: Text("Sign in with Facebook"),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),

          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(FontAwesomeIcons.facebookF),
              const Spacer(),
              Text(text),
              const Spacer(),
              const Icon(
                FontAwesomeIcons.facebookF,
                color: Colors.transparent,
              ),

            ],
          ),
        ),
        onPressed: () {} //=> context.bloc<LoginCubit>().logInWithFacebook(),
    );

    return Container(
      //width: width,
        child: facebookOutlineButton);
  }
}


class _InputField extends StatelessWidget {
  final IconData icon;
  final Widget? suffixIcon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final void Function(String)? onChanged;
  final String? errorText;
  const _InputField({
    required this.icon,
    this.hintText = '',
    this.isPassword = false,
    this.isEmail = false,
    this.onChanged,
    this.errorText,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            height: 48,
            //width: size.width / 1.22,
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          TextField(
            key: key,
            style: const TextStyle(color: Colors.white),
            obscureText: isPassword,
            keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: Icon(icon,
                color: Colors.white.withOpacity(.7),
              ),
              suffixIcon:suffixIcon,
              border: InputBorder.none,
              //hintMaxLines: 1,
              hintText: hintText,
              errorText: errorText,
              helperText: '',
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(.5)
              ),
            ),
          ),
        ],
      ),
    );
  }

}

*/
