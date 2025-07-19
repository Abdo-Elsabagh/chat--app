import 'package:chat_app/screen/login_screen.dart';
import 'package:chat_app/screen/resigster_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ResgisterScreen.id: (context) => ResgisterScreen(),
        'LoginScreen': (context) => const LoginScreen()
      },
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
      )),
      home: const LoginScreen(),
    );
  }
}
