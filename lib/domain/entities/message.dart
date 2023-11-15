enum FromType { user, bot }

class Message {
  final String text;
  final String? gif;
  final FromType from;

  Message({required this.text, this.gif, required this.from});
}
