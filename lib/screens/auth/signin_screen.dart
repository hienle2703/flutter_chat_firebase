import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/auth/signup_screen.dart';
import 'package:chat/screens/chats/chat_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

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
          TextField(
            decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
                hintText: "Email"),
          ),
          SizedBox(height: 30),
          TextField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                hintText: "Password"),
          ),
          Spacer(),
          PrimaryButton(
            text: "Sign In",
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Register your account",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 12,
                    )),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding * 1.5),
          Spacer(flex: 2)
        ]),
      ),
    ));
  }
}
