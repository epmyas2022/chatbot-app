import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final CrossAxisAlignment alignment;

  final Message message;

  const MyMessageBubble(
      {super.key,
      this.alignment = CrossAxisAlignment.end,
      required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final brightness = Theme.of(context).brightness;

    final sizeScreen = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: alignment,
      children: [
        const SizedBox(height: 7),
        Container(
          decoration: BoxDecoration(
            color: alignment == CrossAxisAlignment.start
                ? Colors.grey[700]
                : colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                Text(message.text, style: const TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 7),
        if (message.gif != null)
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(message.gif!),
                fit: BoxFit.cover,
                height: 150,
                width: sizeScreen.width * 0.7,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Container(
                    width: sizeScreen.width * 0.7,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors
                          .grey[brightness == Brightness.light ? 300 : 700],
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
              ))
      ],
    );
  }
}
//'https://yesno.wtf/assets/no/10-d5ddf3f82134e781c1175614c0d2bab2.gif'