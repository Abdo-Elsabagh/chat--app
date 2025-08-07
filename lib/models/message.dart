import 'package:chat_app/constanst.dart';

class Message {
  final String message;

  Message(
    this.message,
  );
  factory Message.fromjson(jsonData) {
    return Message(jsonData[KMessages]);
  }
}
