import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({super.key, this.text, this.backgrange});

  String? text;
  Color? backgrange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 10),
        height: 60,
        width: 120,
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
