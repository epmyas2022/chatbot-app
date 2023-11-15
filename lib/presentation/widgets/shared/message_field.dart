import 'package:flutter/material.dart';

class MessageField extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageField({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final borderCustom = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Type a message with ?',
      suffixIcon: IconButton(
        onPressed: () {
          final value = textController.value.text;
          onValue(value);
        },
        icon: const Icon(Icons.send),
      ),
      filled: true,
      enabledBorder: borderCustom,
      focusedBorder: borderCustom,
    );
    return TextFormField(
      decoration: inputDecoration,
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
