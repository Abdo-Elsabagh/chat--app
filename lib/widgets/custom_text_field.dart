import 'package:flutter/material.dart';

class CstomTextFiled extends StatelessWidget {
  CstomTextFiled(
      {super.key,
      this.hinttext,
      this.labeText,
      this.prefixIco,
      this.suffixIcon,
      this.keyboardType,
      this.isVisible = false,
      this.onChange});
  String? labeText;
  String? hinttext;
  Icon? prefixIco;
  IconButton? suffixIcon;
  TextInputType? keyboardType;
  bool isVisible;

  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'field is required';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
        onChanged: onChange,
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
