import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/providers/theme_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatTheme = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBot  😎'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Switch(
                value: chatTheme.brightness,
                onChanged: (value) {
                  chatTheme.changeBrightness(value);
                }),
          ),
        ],
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pics.craiyon.com/2023-05-24/e66398694f434564b54461906616f73e.webp')),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messagesList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messagesList[index];

                return MyMessageBubble(
                    message: message,
                    alignment: message.from == FromType.user
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start);
              },
            )),
            const SizedBox(height: 10),
            MessageField(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
