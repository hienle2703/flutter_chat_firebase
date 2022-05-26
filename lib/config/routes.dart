import 'package:chat/blocs/app/app_bloc.dart';
import 'package:chat/screens/auth/signin_screen.dart';
import 'package:chat/screens/chats/chat_screen.dart';
import 'package:chat/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [WelcomeScreen.page()];
    case AppStatus.unauthenticated:
      return [ChatScreen.page()];
  }
}
