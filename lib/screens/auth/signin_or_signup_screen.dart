import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/auth/signin_screen.dart';
import 'package:chat/screens/chats/chat_screen.dart';
import 'package:flutter/material.dart';

class SignInOrSignUpScreen extends StatelessWidget {
  const SignInOrSignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(children: [
          Spacer(flex: 2),
          Image.asset(
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? "assets/images/Logo_light.png"
                  : "assets/images/Logo_dark.png",
              height: 146),
          Spacer(),
          PrimaryButton(
              text: "Sign In",
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()))),
          SizedBox(height: kDefaultPadding * 1.5),
          PrimaryButton(
              color: Theme.of(context).colorScheme.secondary,
              text: "Sign Up",
              press: () {}),
          Spacer(flex: 2)
        ]),
      ),
    ));
  }
}
