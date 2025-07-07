import 'package:flutter/material.dart';

class CstomTextFiled extends StatelessWidget {
  CstomTextFiled({
    super.key,
    this.hinttext,
    this.labeText,
    this.prefixIco,
    this.suffixIcon,
    this.keyboardType,
    this.isVisible = false,
  });
  String? labeText;
  String? hinttext;
  Icon? prefixIco;
  IconButton? suffixIcon;
  TextInputType? keyboardType;
  bool isVisible;
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: keyboardType,
        obscureText: isVisible,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            prefixIcon: prefixIco,
            labelText: labeText,
            hintText: hinttext,
            suffixIcon: suffixIcon));
  }
}
