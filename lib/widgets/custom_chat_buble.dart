import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({super.key, this.text, this.backgrange});

  String? text;
  Color? backgrange;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 32),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
                topRight: Radius.circular(32)),
            color: backgrange),
        child: Text(
          text!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
