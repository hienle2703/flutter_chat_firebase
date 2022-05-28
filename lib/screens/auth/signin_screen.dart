import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/cubits/login_cubit.dart';
import 'package:chat/repositories/auth_repository.dart';
import 'package:chat/screens/auth/signup_screen.dart';
import 'package:chat/screens/chats/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: BlocProvider(
          create: (context) => LoginCubit(
            context.read<AuthRepository>(),
          ),
          child: const LoginForm(),
        ),
      ),
    ));
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          // Handling error
        }
        if (state.status == LoginStatus.success) {
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
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  {context.read<LoginCubit>().emailChanged(value)},
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
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) =>
              previous.password != current.password,
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  {context.read<LoginCubit>().passwordChanged(value)},
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
        Spacer(),
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            return PrimaryButton(
              text: "Sign In",
              press: () => {
                context.read<LoginCubit>().loginWithCredentials(),
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ChatScreen(),
                //   ),
                // ),
              },
            );
          },
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
    );
  }
}
