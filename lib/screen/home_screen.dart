import 'package:chat_app/constanst.dart';
import 'package:chat_app/widgets/custom_chat_buble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static String id = 'ChatScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              KLogo,
              height: 70,
            ),
            const Text(
              'Chat',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: kPrimaryColors,
      ),
      body: ListView.builder(
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return ChatBuble(
            backgrange: kPrimaryColors,
            text: 'i am new user ',
          );
        },
      ),
    );
  }
}
