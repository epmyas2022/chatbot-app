import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/theme_provider.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messagesList = [];

  final chatScrollController = ScrollController();

  final ThemeProvider themeProvider;

  ChatProvider(this.themeProvider);

  Future<void> sendMessage(String text) async {
    messagesList.add(Message(text: text, from: FromType.user));

    if (text.contains('change theme')) themeProvider.changeColorRandom();

    if (text.isEmpty) return;

    if (text.endsWith('?')) await answerHer();

    notifyListeners();
    moveScrollEnd();
  }

  Future<void> answerHer() async {
    final message = await GetYesNo.getAnswer();
    messagesList.add(message);
  }

  Future<void> moveScrollEnd() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
