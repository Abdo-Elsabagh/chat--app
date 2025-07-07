import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
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
                  height: 80,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CstomTextFiled(
                  prefixIco: const Icon(Icons.email),
                  labeText: 'Email',
                  hinttext: 'Enter your Email',
                ),
                const SizedBox(height: 10),
                CstomTextFiled(
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
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTop: () {},
                  textButton: 'login',
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I havn\'t an account ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          // Navigator.of(context)
                          //     .pushReplacement(MaterialPageRoute(
                          //   builder: (context) => const RegisterView(),
                          // ));
                        },
                        child: const Text(
                          'Creat One!',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
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
