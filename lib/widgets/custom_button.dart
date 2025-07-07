import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onTop, this.textButton});
  VoidCallback? onTop;
  String? textButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTop,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        width: double.infinity,
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Text(
          textButton!,
          style: const TextStyle(color: Colors.blue, fontSize: 24),
        ),
      ),
    );
  }
}
