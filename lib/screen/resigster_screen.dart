import 'package:chat_app/constanst.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResgisterScreen extends StatefulWidget {
  const ResgisterScreen({super.key});
  static String id = 'ResgisterScreen';
  @override
  State<ResgisterScreen> createState() => _ResgisterScreenState();
}

class _ResgisterScreenState extends State<ResgisterScreen> {
  @override
  bool isVisable = true;
  String? email;
  String? passwoed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColors,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/scholar.png',
                  width: 100,
                  height: 100,
                ),
                const Text(
                  'Scholar Chat',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico'),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Row(
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CstomTextFiled(
                  onChange: (data) {
                    email = data;
                  },
                  prefixIco: const Icon(Icons.email),
                  labeText: 'Email',
                  hinttext: 'Enter your Email',
                ),
                const SizedBox(height: 10),
                CstomTextFiled(
                  onChange: (data) {
                    passwoed = data;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  isVisible: isVisable,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisable = !isVisable;
                        });
                      },
                      icon: Icon((isVisable)
                          ? Icons.remove_red_eye
                          : Icons.visibility_off_rounded)),
                  prefixIco: const Icon(Icons.lock),
                  hinttext: 'Enter your Password',
                  labeText: 'Password',
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTop: () async {
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email!, password: passwoed!);
                    } on FirebaseAuthException catch (e) {
                      String message = "";

                      if (e.code == 'weak-password') {
                        message = 'The password provided is too weak.';
                      } else if (e.code == 'email-already-in-use') {
                        message = 'The account already exists for that email.';
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red, content: Text(message)));
                    }

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          'Registration Successful',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )));
                  },
                  textButton: 'Resgister',
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account ?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Sing In!',
                          style:
                              TextStyle(color: Color(0xffC7EDE6), fontSize: 16),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
