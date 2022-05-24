import 'package:chat/constants.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import 'audio_message.dart';
import 'text_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key key,
    @required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContainer(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
          break;
        case ChatMessageType.audio:
          return AudioMessage(message: message);
          break;
        default:
          return SizedBox();
      }
    }

    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!message.isSender) ...[
          CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(width: kDefaultPadding / 2),
        ],
        messageContainer(message),
      ],
    );
  }
}
