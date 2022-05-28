import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/cubits/signup/signup_cubit.dart';
import 'package:chat/repositories/auth_repository.dart';
import 'package:chat/screens/chats/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signin_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: BlocProvider(
          create: (context) => SignUpCubit(context.read<AuthRepository>()),
          child: SignUpView(),
        ),
      ),
    ));
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == SignUpStatus.error) {
          // Handling error
        }
        if (state.status == SignUpStatus.success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(),
            ),
          );
        }
      },
      child: Column(children: [
        Spacer(flex: 2),
        Image.asset(
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? "assets/images/Logo_light.png"
                : "assets/images/Logo_dark.png",
            height: 146),
        Spacer(),
        BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  {context.read<SignUpCubit>().emailChanged(value)},
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: kPrimaryColor,
                  ),
                  hintText: "Email"),
            );
          },
        ),
        SizedBox(height: 30),
        BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, current) =>
              previous.password != current.password,
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  {context.read<SignUpCubit>().passwordChanged(value)},
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  hintText: "Password"),
            );
          },
        ),
        SizedBox(height: 30),
        BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, current) =>
              previous.confirmPassword != current.confirmPassword,
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  {context.read<SignUpCubit>().confirmPasswordChanged(value)},
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  hintText: "Confirm password"),
            );
          },
        ),
        Spacer(),
        PrimaryButton(
          text: "Register",
          color: Theme.of(context).colorScheme.secondary,
          press: () => {
            context.read<SignUpCubit>().signUpWithCredentials(),
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ChatScreen(),
            //   ),
            // ),
          },
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?",
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
    );
  }
}
